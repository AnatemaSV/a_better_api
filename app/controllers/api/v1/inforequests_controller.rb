# frozen_string_literal: true

module Api
  module V1
    class InforequestsController < ApplicationController
      include ActionController::MimeResponds

      def index
        p = params[:page].to_i <= 0 ? 1 : params[:page].to_i
        pp = params[:per_page] || 5
        @inforequests = Inforequest.all.paginate(page: p, per_page: pp)

        render json: JSONAPI::Serializer.serialize(
          @inforequests,
          is_collection: true,
          namespace: Api::V1,
          include_links: false,
          base_url: 'https://a-better-api.herokuapp.com/api/v1',
          meta: {
            project_authors: 'anatema.org',
            page: p,
            per_page: pp,
            total_pages: @inforequests.total_pages
          }
        )
      end

      def show
        @inforequest = Inforequest.find params[:id]
        render json: JSONAPI::Serializer.serialize(
          @inforequest,
          namespace: Api::V1,
          base_url: 'https://a-better-api.herokuapp.com/api/v1',
          serializer: Inforequest2Serializer,
          meta: {
            project_authors: 'anatema.org'
          }
        )
      end

      def search
        p = params[:page].to_i <= 0 ? 1 : params[:page].to_i
        pp = params[:per_page] || 5

        @inforequests = Inforequest.all
        if params[:query].present? && !params[:query].blank?
          @inforequests = @inforequests.search_by_term(params[:query])
        end

        if params[:'date-begin'].present? && !params[:'date-begin'].blank?
          @inforequests = @inforequests.dbegin(params[:'date-begin'])
        end

        if params[:'date-end'].present? && !params[:'date-end'].blank?
          @inforequests = @inforequests.dend(params[:'date-end'])
        end

        if params[:result].present? && !params[:result].blank?
          result = Result.find(params[:result].to_i) || Result.first
          @infocomplains = @infocomplains.rtext(result.id)
        end

        if params[:status].present? && !params[:status].blank?
          status = params[:status].to_i.positive? ? Status.find_by(name: 'En trámite').id : Status.find_by(name: 'Cerrada').id
          @inforequests = @inforequests.stext(status)
        end

        if params[:institution].present? && !params[:institution].blank?
          institution = Institution.exists?(id: params[:institution].to_i) ? Institution.find(params[:institution].to_i).id : Institution.first.id
          @inforequests = @inforequests.by_institution(institution)
        end

        @inforequests = @inforequests.paginate(page: p, per_page: pp)

        render json: JSONAPI::Serializer.serialize(
          @inforequests,
          is_collection: true,
          namespace: Api::V1,
          include_links: false,
          base_url: 'https://a-better-api.herokuapp.com/api/v1',
          meta: {
            project_authors: 'anatema.org',
            page: p,
            per_page: pp,
            total_pages: @inforequests.total_pages
          }
        )
      end

      def csv
        @inforequests = Inforequest.all

        respond_to do |format|
          format.csv do
            send_data @inforequests.to_csv,
                      filename: "inforequests-#{Date.today}.csv"
          end
        end
      end
    end
  end
end
