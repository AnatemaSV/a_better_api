# frozen_string_literal: true

class CreateInfocomplains < ActiveRecord::Migration[6.0]
  def change
    create_table :infocomplains do |t|
      t.string :_id
      t.string :case_id
      t.integer :institution_id
      t.text :comment
      t.date :date
      t.text :detail
      t.date :finish
      t.string :office
      t.string :office_id
      t.text :overview
      t.integer :ref
      t.string :_result
      t.string :reviewer
      t.integer :reviewer_id
      t.date :start
      t.string :_status
      t.integer :status_id
      t.integer :result_id
      t.text :url
      t.timestamps
    end
  end
end
