class Race < ApplicationRecord
  has_many :race_registrations
  has_many :race_results

  validates :city, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true

  has_attached_file :sanction
  validates_attachment :sanction, content_type: { content_type: "application/pdf" }

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
