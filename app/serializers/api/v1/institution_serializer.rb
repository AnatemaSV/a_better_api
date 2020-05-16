# frozen_string_literal: true

require 'jsonapi-serializers'

module Api
  module V1
    class InstitutionSerializer
      include JSONAPI::Serializer

      attribute :name
      attribute :alac_funde_id
      attribute :average_response
      attribute :total_inforequest
      attribute :total_status
      attribute :total_result
    end
  end
end
