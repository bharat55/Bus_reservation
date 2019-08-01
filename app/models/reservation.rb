class Reservation < ApplicationRecord
  belongs_to :bus

  validates :date, presence: true
  validates :seats, presence: true


  scope :my_reservation,->(user){where(user_id:user).or(where(bus_owner_id:user))}

end
