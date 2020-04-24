# frozen_string_literal: true

class CreateInforequests < ActiveRecord::Migration[6.0]
  def change
    create_table :inforequests do |t|
      t.string :_id
      t.string :case_id
      t.text :comment
      t.date :date
      t.text :detail
      t.date :finish
      t.string :office
      t.string :office_id
      t.text :overview
      t.integer :ref
      t.string :result
      t.date :start
      t.string :status
      t.text :url
      t.timestamps
    end
  end
end
