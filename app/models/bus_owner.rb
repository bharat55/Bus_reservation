class BusOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status:{approve:"approve",disapprove:"disapprove",suspend:"suspend"}
  has_many :buses
  validates :name, presence: true
  validates :license_number, presence: true
  validates :gst_number, presence: true
  validates :experience, presence: true
end
