# frozen_string_literal: true

class Institution < ApplicationRecord
  has_many :inforequests
  validates :office_id, uniqueness: true
end
