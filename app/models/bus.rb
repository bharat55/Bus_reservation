class Bus < ApplicationRecord
  belongs_to :bus_owner
  has_many :reservations

  enum status:{active:"active",suspended:"suspended"}


  validates :name, presence: true
  validates :registration_number, presence: true
  validates :source, presence: true
  validates :destination, presence: true
  validates :total_seats, presence: true
  validates :departure_time, presence: true
  validates :arrival_time, presence: true




 def self.search(source, destination)
    if source.blank?
      where("destination LIKE :destination ",{:destination => "#{destination}"})
    elsif destination.blank?
      where("source LIKE :source ",{:source => "#{source}"})
    elsif  !source.blank? && !destination.blank?
      where("source LIKE :source AND destination LIKE :destination ",
         {:source => "#{source}%", :destination => "#{destination}"})
    end
 end

 

 # def avaialable_seats(date)

 # end

end

