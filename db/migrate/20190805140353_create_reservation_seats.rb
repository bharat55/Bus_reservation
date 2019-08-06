class CreateReservationSeats < ActiveRecord::Migration[5.2]
  def change
    create_table :reservation_seats do |t|
      t.references :reservation, foreign_key: true
      t.integer :seat_no

      t.timestamps
    end
  end
end
