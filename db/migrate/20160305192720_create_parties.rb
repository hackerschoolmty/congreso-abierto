class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :acronym
      t.integer :status, default: 1

      t.timestamps null: false
    end
  end
end
