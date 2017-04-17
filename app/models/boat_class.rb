class BoatClass < ApplicationRecord
  validates :class_name, presence: true, uniqueness: true
  validates :registration_fee, presence: true
end
