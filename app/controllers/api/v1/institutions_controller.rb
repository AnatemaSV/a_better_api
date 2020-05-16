# frozen_string_literal: true

module Api
  module V1
    class InstitutionsController < ApplicationController
      def index
        p = params[:page].to_i <= 0 ? 1 : params[:page].to_i
        pp = params[:per_page] || 5
        @institutions = Institution.all.paginate(page: p, per_page: pp)

        render json: JSONAPI::Serializer.serialize(
          @institutions,
          is_collection: true,
          namespace: Api::V1,
          include_links: false,
          base_url: 'https://a-better-api.herokuapp.com/api/v1',
          meta: {
            project_authors: 'anatema.org',
            page: p,
            per_page: pp,
            total_pages: @institutions.total_pages
          }
        )
      end

      def show; end
    end
  end
end
