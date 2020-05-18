# frozen_string_literal: true

class Document < ApplicationRecord
  include Metka::Model(column: 'tags')
  has_and_belongs_to_many :inforequest
  has_and_belongs_to_many :infocomplains

  validates :_id, uniqueness: true
end
