class FixEnumColumns < ActiveRecord::Migration
  def up
    rename_table :comission_representatives, :commission_representatives
    rename_table :comission_topics, :commission_topics
    rename_table :comissions, :commissions
    rename_column :commissions, :comission_topic_id, :commission_topic_id

    rename_column :commission_representatives, :comission_id, :commission_id
    add_column(:initiatives, :status, :integer, default: 0)

    drop_table :educations

    change_column_default(:legislature_representatives, :status, 0)
    change_column_default(:initiatives, :status, 0)
    change_column_default(:commission_representatives, :status, 0)
    change_column_default(:votes, :value, 0)

  end

  def down
    rename_table :commission_representatives, :comission_representatives
    rename_table :commission_topics, :comission_topics
    rename_table :commissions, :comissions

    rename_column :comissions, :commission_topic_id, :comission_topic_id

    rename_column :comission_representatives, :commission_id, :comission_id
    change_column_default(:legislature_representatives, :status, nil)
    change_column_default(:initiatives, :status,  nil)
    change_column_default(:comission_representatives, :status, nil)
    change_column_default(:votes, :value, nil)

    remove_column(:initiatives, :status)
  end
end
