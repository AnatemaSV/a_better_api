class CreateJoinTableDocumentsInforequests < ActiveRecord::Migration[6.0]
  def change
    create_join_table :documents, :inforequests do |t|
      # t.index [:document_id, :inforequest_id]
      # t.index [:inforequest_id, :document_id]
    end
  end
end
