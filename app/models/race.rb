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

  scope :future, -> { where('start_date >= ?', Date.today) } #gets collection of all races in the future

  scope :races_this_year, -> { where('start_date > ? AND start_date < ?', Date.today.beginning_of_year, Date.today.end_of_year) }


  def self.title_location_list
    Race.future.map do |race|
      ["#{race.title} - #{race.city}, #{race.state}", race.id]
    end
  end

  def future?
    self.start_date.future? #checks if specific race object is in the future
  end

  def race_this_year?
    self.start_date > Date.today.beginning_of_year && self.start_date < Date.today.end_of_year
  end

end
