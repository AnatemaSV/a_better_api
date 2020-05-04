# frozen_string_literal: true

class Inforequest < ApplicationRecord
  has_and_belongs_to_many :documents
  has_many :updates
  belongs_to :institution
  belongs_to :result
  belongs_to :status

  validates :_id, uniqueness: true

  include PgSearch::Model
  pg_search_scope :search_by_term, against: %i[artist_name name kind
                                               copyright artist_url url],
                                   using: {
                                     tsearch: {
                                       any_word: true,
                                       prefix: true
                                     }
                                   }

  def alac_funde_id
    _id
  end

  def alac_funde_case_id
    case_id
  end

  def alac_funde_institution_id
    office_id
  end

  def alac_funde_ref
    ref
  end

  def date_begin
    date
  end

  def date_finish
    finish
  end

  def status_text
    _status
  end
  def result_text
    _result
  end
end
