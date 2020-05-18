class CreateIcresults < ActiveRecord::Migration[6.0]
  def change
    create_table :icresults do |t|
      t.string :name
      t.timestamps
    end
  end
end
