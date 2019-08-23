class Reservation < ApplicationRecord
  belongs_to :bus
  belongs_to :reservable, polymorphic: true
  has_many :reservation_seats, dependent: :destroy

  validates :date, presence: true
  validates :seat_nos, presence: true
  enum status:{done:"done",cancelled:"cancelled"}


  scope :bus_reservation,->(bus){where(bus_id:bus)}

  def seat_nos
    reservation_seats.map(&:seat_no)
  end

  def seat_nos=(nos=[])
    nos.each do |no|
      reservation_seats.new(seat_no: no)
    end
  end
end
