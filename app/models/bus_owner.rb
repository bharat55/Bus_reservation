class BusOwner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable

  has_many :buses
  has_many :reservations, as: :reservable

  validates :name, presence: true
  validates :license_number, presence: true
  validates :gst_number, presence: true
  validates :experience, presence: true

  enum status:{approved:"approved","Approval_Pending":"Approval Pending",suspended:"suspended"}


end
