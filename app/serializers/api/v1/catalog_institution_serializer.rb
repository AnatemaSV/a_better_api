# frozen_string_literal: true

require 'jsonapi-serializers'

module Api
  module V1
    class CatalogInstitutionSerializer
      include JSONAPI::Serializer

      attribute :name
    end
  end
end
