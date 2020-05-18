# frozen_string_literal: true

module Api
  module V1
    class CatalogsController < ApplicationController
      def index; end

      def institutions
        @institutions = Institution.select(:id, :name)

        render json: @institutions
      end

      def inforequest_results
        @results = Result.select(:id, :name)
        render json: @results
      end
    end
  end
end
