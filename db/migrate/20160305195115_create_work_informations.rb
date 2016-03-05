class CreateWorkInformations < ActiveRecord::Migration
  def change
    create_table :work_informations do |t|

      t.timestamps null: false
    end
  end
end
