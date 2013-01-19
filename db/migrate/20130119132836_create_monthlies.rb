class CreateMonthlies < ActiveRecord::Migration
  def change
    create_table :monthlies do |t|
      t.integer :user_id
      t.integer :year
      t.integer :month

      t.timestamps
    end
  end
end
