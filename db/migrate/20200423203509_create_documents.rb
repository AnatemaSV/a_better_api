# frozen_string_literal: true

class CreateDocuments < ActiveRecord::Migration[6.0]
  def change
    create_table :documents do |t|
      t.integer :inforequest_id
      t.string :_id
      t.date :date
      t.integer :downloaded
      t.text :overview
      t.text :path
      t.string :tags
      t.text :title
      t.timestamps
    end
  end
end
