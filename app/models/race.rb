class Race < ApplicationRecord
  acts_as_paranoid

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

  scope :registerable, -> { where('start_date >= ?', Date.today+5) } #gets collection of all races open for registration

  scope :races_this_year, -> { where('start_date > ? AND start_date < ?', Date.today.beginning_of_year, Date.today.end_of_year) }


  def self.title_location_list
    Race.registerable.map do |race|
      ["#{race.city}, #{race.state} - #{race.title}", race.id]
    end
  end

  def future?
    self.start_date.future? #checks if specific race object is in the future
  end

  def race_this_year?
    self.start_date > Date.today.beginning_of_year && self.start_date < Date.today.end_of_year
  end

  def registerable?
    self.start_date > Date.today+5
  end

end
