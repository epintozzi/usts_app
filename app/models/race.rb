class Race < ApplicationRecord
  has_many :race_registrations

  validates :city, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
