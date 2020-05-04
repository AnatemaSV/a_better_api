# frozen_string_literal: true

module Api
  module V1
    class InforequestsController < ApplicationController
      def index
        @inforequests = Inforequest.all
        render json: JSONAPI::Serializer.serialize(
          @inforequests,
          is_collection: true,
          namespace: Api::V1,
          include_links: false
        )
      end
    end
  end
end
