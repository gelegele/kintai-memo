class RemoveTypeFromTimeRecords < ActiveRecord::Migration
  def up
    remove_column :time_records, :type
  end

  def down
    add_column :time_records, :type, :int
  end
end
