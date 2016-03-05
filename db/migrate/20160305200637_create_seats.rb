class CreateSeats < ActiveRecord::Migration
  def change
    create_table :seats do |t|
      t.integer :legislature_id
      t.string :row
      t.string :column

      t.timestamps null: false
    end
  end
end
