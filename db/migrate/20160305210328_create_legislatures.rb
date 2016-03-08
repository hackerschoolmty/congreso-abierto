class CreateLegislatures < ActiveRecord::Migration
  def change
    create_table :legislatures do |t|
      t.date :starts_on
      t.date :ends_on
      t.string :name
      t.integer :status

      t.timestamps null: false
    end
  end
end
