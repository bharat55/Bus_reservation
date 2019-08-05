class ChangeSeatsColumnToTotalSeats < ActiveRecord::Migration[5.2]
  def change
    rename_column :reservations, :seats, :total_seats
  end
end
