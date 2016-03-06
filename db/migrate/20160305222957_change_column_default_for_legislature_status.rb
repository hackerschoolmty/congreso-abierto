class ChangeColumnDefaultForLegislatureStatus < ActiveRecord::Migration
  def change
    change_column_default(:legislatures, :status, 0)
  end
end
