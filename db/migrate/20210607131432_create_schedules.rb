class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.datetime :time
      t.references :tennis_court, null: false, foreign_key: true

      t.timestamps
    end
  end
end
