class Document < ApplicationRecord
  include Metka::Model(column: 'tags')
  has_and_belongs_to_many :inforequest

  validates :_id, uniqueness: true



end
