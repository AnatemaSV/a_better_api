# frozen_string_literal: true

class Institution < ApplicationRecord
  has_many :inforequests
  validates :office_id, uniqueness: true

  def alac_funde_id
    office_id
  end

  def average_response
    inforequests.average('inforequests.finish - inforequests.date').to_i
  end

  def total_inforequest
    inforequests.count
  end

  def total_status
    inforequests.group('inforequests._status').count
  end

  def total_result
    inforequests.group('inforequests._result').count
  end
end
