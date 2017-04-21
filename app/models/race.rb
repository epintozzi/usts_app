class Race < ApplicationRecord
  has_many :race_registrations

  validates :city, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true

  def self.title_location_list
    race_list = []
    all.each do |race|
      title_and_location = ["#{race.title} - #{race.city}, #{race.state}", race.id]
      race_list << title_and_location
    end
    return race_list
  end
end
