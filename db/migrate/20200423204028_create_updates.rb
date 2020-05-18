# frozen_string_literal: true

class CreateUpdates < ActiveRecord::Migration[6.0]
  def change
    create_table :updates do |t|
      t.integer :inforequest_id
      t.integer :infocomplain_id
      t.date :date
      t.text :details
      t.timestamps
    end
  end
end
