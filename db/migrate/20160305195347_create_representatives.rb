class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :phone
      t.integer :representative_type
      t.integer :parent_id
      t.string  :twitter
      t.string  :facebook
      t.integer :initiatives_count
      t.timestamps null: false
    end
  end
end
