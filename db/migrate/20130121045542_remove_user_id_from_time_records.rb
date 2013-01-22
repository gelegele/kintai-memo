class RemoveUserIdFromTimeRecords < ActiveRecord::Migration
  def up
    remove_column :time_records, :user_id
  end

  def down
    add_column :time_records, :user_id, :integer
  end
end
