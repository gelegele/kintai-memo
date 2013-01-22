class AddMonthlyIdToTimeRecords < ActiveRecord::Migration
  def change
    add_column :time_records, :monthly_id, :integer
  end
end
