class Bus < ApplicationRecord
  belongs_to :bus_owner

  validates :name, presence: true
  validates :registration_number, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :total_seats, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true

end
