# frozen_string_literal: true

class Inforequest < ApplicationRecord
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

  scope :dbegin, ->(date) { where('date >= ?', date.to_date) }
  scope :dend,  ->(date) { where('finish >= ?', date.to_date) }
  scope :stext, ->(status) { where('status_id = ?', status.to_i) }
  scope :rtext, ->(result) { where('result_id = ?', result.to_i) }
  scope :by_institution, ->(institution) { where('institution_id = ?', institution.to_i) }

  RESULTS = Result.pluck(:name).sort

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

  def total_documents
    documents.count
  end

  def related_documents
    documents.select("date, title, overview, tags, path, id, _id AS alac_funde_case_id")
  end
end
