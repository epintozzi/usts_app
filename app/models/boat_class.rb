class BoatClass < ApplicationRecord
  acts_as_paranoid
  
  has_many :race_registrations
  has_many :race_results

  validates :class_name, presence: true, uniqueness: true
  validates :registration_fee, presence: true
end
