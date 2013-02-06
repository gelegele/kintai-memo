class AddTimeTableIdToWorkingTimes < ActiveRecord::Migration
  def change
    add_column :working_times, :time_table_id, :integer
    add_index :working_times, :time_table_id    
  end
end
