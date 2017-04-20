class BoatClass < ApplicationRecord
  has_many :race_registrations
  
  validates :class_name, presence: true, uniqueness: true
  validates :registration_fee, presence: true
end
