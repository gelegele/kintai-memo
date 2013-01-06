class CreateTimeRecords < ActiveRecord::Migration
  def change
    create_table :time_records do |t|
      t.references :user
      t.date :date
      t.integer :type
      t.timestamp :in
      t.timestamp :out
      t.string :note

      t.timestamps
    end
    add_index :time_records, :user_id
  end
end
