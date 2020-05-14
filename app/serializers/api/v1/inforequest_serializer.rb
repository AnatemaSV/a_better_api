# frozen_string_literal: true

require 'jsonapi-serializers'

module Api
  module V1
    class InforequestSerializer
      include JSONAPI::Serializer

      attribute :comment
      attribute :detail
      attribute :overview
      attribute :date_begin
      attribute :date_finish
      attribute :status_text
      attribute :result_text

      attribute :alac_funde_ref
      attribute :alac_funde_id
      attribute :alac_funde_case_id
      attribute :alac_funde_institution_id

    end
  end
end
