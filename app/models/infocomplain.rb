# frozen_string_literal: true

require 'csv'
class Infocomplain < ApplicationRecord
  has_and_belongs_to_many :documents
  has_many :updates
  belongs_to :institution
  belongs_to :icresult
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
    documents.select('date, title, overview, tags, path, id, _id AS alac_funde_case_id')
  end

  def self.to_csv
    attributes = %w[_id case_id institution_id comment date detail finish office
                    office_id overview ref _result reviewer reviewer_id start
                    _status status_id icresult_id url]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |user|
        csv << attributes.map { |attr| user.send(attr) }
      end
    end
  end
end
