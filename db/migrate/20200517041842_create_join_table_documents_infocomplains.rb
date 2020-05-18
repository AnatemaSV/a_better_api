class CreateJoinTableDocumentsInfocomplains < ActiveRecord::Migration[6.0]
  def change
    create_join_table :documents, :infocomplains do |t|
      # t.index [:document_id, :complain_id]
      # t.index [:complain_id, :document_id]
    end
  end
end
