class RemoveUserIdFromWorkingTimes < ActiveRecord::Migration
  def up
    remove_column :working_times, :user_id
  end

  def down
    add_column :working_times, :user_id, :integer
  end
end
