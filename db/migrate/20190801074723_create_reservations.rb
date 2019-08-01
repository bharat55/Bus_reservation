class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.references :bus, foreign_key: true
      t.integer :user_id
      t.integer :bus_owner_id
      t.integer :seats
      t.date :date
      t.time :time
      t.string :from
      t.string :to

      t.timestamps
    end
  end
end
