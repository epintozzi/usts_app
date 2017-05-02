class RaceRegistration < ApplicationRecord
  belongs_to :boat_class
  belongs_to :usts_registration
  belongs_to :race

  validates :boat_number, presence: true
  validates :race, uniqueness: { scope: [:usts_registration, :boat_class] }
end
