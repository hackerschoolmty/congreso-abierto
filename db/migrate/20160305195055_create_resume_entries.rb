class CreateResumeEntries < ActiveRecord::Migration
  def change
    create_table :resume_entries do |t|
      t.date :starts_on
      t.date :ends_on
      t.string :institution_name
      t.text :description
      t.string :degree
      t.string :type

      t.timestamps null: false
    end
  end
end
