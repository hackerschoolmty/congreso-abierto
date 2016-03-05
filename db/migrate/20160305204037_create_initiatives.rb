class CreateInitiatives < ActiveRecord::Migration
  def change
    create_table :initiatives do |t|
      t.string :name
      t.text :description
      t.integer :initiative_type
      t.date :voting_date

      t.timestamps null: false
    end
  end
end
