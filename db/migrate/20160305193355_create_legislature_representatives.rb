class CreateLegislatureRepresentatives < ActiveRecord::Migration
  def change
    create_table :legislature_representatives do |t|
      t.integer :legislature_id
      t.integer :representative_id
      t.integer :district_id
      t.integer :party_id
      t.integer :seat_id
      t.integer :status

      t.timestamps null: false
    end
  end
end
