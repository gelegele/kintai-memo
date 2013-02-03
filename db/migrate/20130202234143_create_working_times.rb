class CreateWorkingTimes < ActiveRecord::Migration
  def change
    create_table :working_times do |t|
      t.references :user
      t.integer :start_hours
      t.integer :start_minutes
      t.integer :end_hours
      t.integer :end_minutes

      t.timestamps
    end
    add_index :working_times, :user_id
  end
end
