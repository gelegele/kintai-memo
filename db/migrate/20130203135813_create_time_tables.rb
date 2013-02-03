class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.references :user
      t.integer :fixed_start_hours
      t.integer :fixed_start_minutes
      t.integer :fixed_end_hours
      t.integer :fixed_end_minutes

      t.timestamps
    end
    add_index :time_tables, :user_id
  end
end
