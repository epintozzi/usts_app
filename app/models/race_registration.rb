class RaceRegistration < ApplicationRecord
  belongs_to :boat_class
  belongs_to :usts_registration
  belongs_to :race
  belongs_to :creator, class_name: "User"

  validates :race, presence: true
  validates :creator, presence: true
  validates :usts_registration, presence: true
  validates :boat_number, presence: true
  validates :boat_class, presence: true
  validates :boat_class, uniqueness: { scope: [:usts_registration, :race], message: "has already been registered for this driver and race location" }
end
