class CreateBuses < ActiveRecord::Migration[5.2]
  def change
    create_table :buses do |t|
      t.string :name
      t.integer :registration_number
      t.string :source
      t.string :destination
      t.integer :total_seats
      t.references :bus_owners, foreign_key: true
      t.time :departure_time
      t.time :arrival_time

      t.timestamps
    end
  end
end
