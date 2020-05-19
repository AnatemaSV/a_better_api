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
        @totals = {}
        @totals['total_inforequests'] = Inforequest.count
        @totals['total_irstatus'] = Inforequest.group(:_status).count
        @totals['total_irresults'] = Inforequest.group(:_result).count

        @totals['total_infocomplains'] = Infocomplain.count
        @totals['total_icstatus'] = Infocomplain.group(:_status).count
        @totals['total_icresults'] = Infocomplain.group(:_result).count

        render json: @totals
      end

      def inforequests_history
        institution = params[:institution]

        @history = Inforequest
                   .where('institution_id = ?', institution)
                   .group('(EXTRACT(YEAR FROM date))::integer')
                   .group('(EXTRACT(MONTH FROM date))::integer')
                   .order('2 DESC, 3 DESC').count

        render json: @history
      end
    end
  end
end
