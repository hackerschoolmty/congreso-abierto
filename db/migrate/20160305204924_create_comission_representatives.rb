class CreateComissionRepresentatives < ActiveRecord::Migration
  def change
    create_table :comission_representatives do |t|
      t.integer :comission_id
      t.integer :representative_id
      t.integer :position
      t.integer :status

      t.timestamps null: false
    end
  end
end
