class BusOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum status:{approved:"approve",unapproved:"unapprove",suspend:"suspend"}

  validates :name, presence: true
  validates :license_number, presence: true
  validates :gst_number, presence: true
  validates :experience, presence: true
end
