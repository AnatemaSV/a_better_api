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

        # @query = Inforequest.where('institution_id = ?', institution).group('(EXTRACT(YEAR FROM date))::integer').group('(EXTRACT(MONTH FROM date))::integer').order('2 DESC, 3 DESC').count

        # @query = Inforequest.where('institution_id = ?', institution).group_by { |m| m.date.beginning_of_month }

        @query = Inforequest
                  .where('institution_id = ?', institution)
                  .group_by_month(
                    :date,
                    format: '%Y-%m',
                    range: Date.new(2012)..Time.now).count

        @history = []
        @query.each do |k, v|
          date = k.split('-')
          @history << [year: date[0], month: date[1], inforequests: v.to_s]
        end

        render json: @history.flatten
      end

      def infocomplains_history
        institution = params[:institution]

        @query = Infocomplain
                  .where('institution_id = ?', institution)
                  .group_by_month(
                    :date,
                    format: '%Y-%m',
                    range: Date.new(2012)..Time.now).count

        @history = []
        @query.each do |k, v|
          date = k.split('-')
          @history << [year: date[0], month: date[1], inforequests: v.to_s]
        end

        render json: @history.flatten
      end
    end
  end
end
