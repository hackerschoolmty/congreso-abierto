class CreateComissionTopics < ActiveRecord::Migration
  def change
    create_table :comission_topics do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
