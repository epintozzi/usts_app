class UstsRegistration < ApplicationRecord
  belongs_to :creator, class_name: "User"

  validates :race_year, presence: true, length: { is: 4 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :usts_number, presence: true, uniqueness: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :birthdate, presence: true
  validates :liability_release?, presence: true, inclusion: { in: [true] }
  validates :membership_type, presence: true
  validates :signature, presence: true

  enum membership_type: [:nonracing, :racing, :kpro]
end
