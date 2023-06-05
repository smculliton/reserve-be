class CreateHours < ActiveRecord::Migration[7.0]
  def change
    create_table :hours do |t|
      t.integer :weekday_start
      t.integer :weekday_end
      t.integer :weekend_start
      t.integer :weekend_end

      t.timestamps
    end
  end
end
