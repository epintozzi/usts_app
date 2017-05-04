class Race < ApplicationRecord
  has_many :race_registrations

  validates :city, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true

  scope :future, -> { where('start_date >= ?', Date.today) }

  def self.title_location_list
    Race.future.map do |race|
      ["#{race.title} - #{race.city}, #{race.state}", race.id]
    end
  end

  def future?
    self.start_date.future?
  end

end
