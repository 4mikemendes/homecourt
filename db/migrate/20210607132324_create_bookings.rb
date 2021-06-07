class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.string :status
      t.datetime :beginning_date_time
      t.datetime :end_date_time
      t.references :user, null: false, foreign_key: true
      t.references :tennis_court, null: false, foreign_key: true

      t.timestamps
    end
  end
end
