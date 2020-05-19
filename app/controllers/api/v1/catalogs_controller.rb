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

      def totals
        @totals = Hash.new
        @totals['total_inforequests'] = Inforequest.count
        @totals['total_irstatus'] = Inforequest.group(:_status).count
        @totals['total_irresults'] = Inforequest.group(:_result).count

        @totals['total_infocomplains'] = Infocomplain.count
        @totals['total_icstatus'] = Infocomplain.group(:_status).count
        @totals['total_icresults'] = Infocomplain.group(:_result).count

        render json: @totals
      end
    end
  end
end
