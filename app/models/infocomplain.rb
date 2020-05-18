class Infocomplain < ApplicationRecord
  has_and_belongs_to_many :documents
  has_many :updates
  belongs_to :institution
  belongs_to :result
  belongs_to :status

  validates :_id, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_term, against: %i[comment detail overview],
                                   using: {
                                     tsearch: {
                                       any_word: true,
                                       prefix: true
                                     }
                                   }
end
