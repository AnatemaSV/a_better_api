# frozen_string_literal: true

require 'swagger_helper'

describe 'API V1 Blogs', swagger_doc: 'v1/swagger.json' do
  path '/inforequests' do
    get 'Retrieves Blogs' do
      description 'Retrieves all the blogs'
      produces 'application/json'
      let(:collection_count) { 5 }
      let(:expected_collection_count) { collection_count }
      before { create_list(:inforequest, collection_count) }
      response '200', 'Blogs retrieved' do
        schema('$ref' => '#/definitions/inforequests_collection')
        run_test! do |response|
          expect(JSON.parse(response.body)['data'].count).to eq(expected_collection_count)
        end
      end
    end
  end
end
