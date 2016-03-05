class CreateComissions < ActiveRecord::Migration
  def change
    create_table :comissions do |t|
      t.integer :legislature_id
      t.string :name
      t.integer :comission_topic_id

      t.timestamps null: false
    end
  end
end
