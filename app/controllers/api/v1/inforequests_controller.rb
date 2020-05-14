# frozen_string_literal: true

module Api
  module V1
    class InforequestsController < ApplicationController
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
          meta: { project_authors: 'anatema.org' }
        )
      end

      def show
        @inforequest = Inforequest.find params[:id]
        render json: JSONAPI::Serializer.serialize(
          @inforequest,
          namespace: Api::V1,
          base_url: 'https://a-better-api.herokuapp.com/api/v1',
          meta: { project_authors: 'anatema.org' }
        )
      end

      def search
        p = params[:page].to_i <= 0 ? 1 : params[:page].to_i
        pp = params[:per_page] || 5

        @inforequests = Inforequest.all
        @inforequests = @inforequest.search_by_term(params[:query]) if params[:query].present? and params[:query].blank?
        @inforequests = @inforequests.dbegin(params[:'date-begin']) if params[:'date-begin'].present?
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
            per_page: pp
          }
        )
      end
    end
  end
end
