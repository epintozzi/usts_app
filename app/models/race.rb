class Race < ApplicationRecord
  acts_as_paranoid

  before_destroy :check_race_registrations#, on: :destroy

  has_many :race_registrations, dependent: :destroy
  has_many :race_results

  validates :city, presence: true
  validates :state, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :title, presence: true

  has_attached_file :sanction
  validates_attachment :sanction, content_type: { content_type: "application/pdf" }

  scope :future, -> { where('start_date >= ?', Date.today) } #gets collection of all races in the future
  scope :past, -> { where('start_date <= ?', Date.today) } #gets collection of all races in the future

  scope :races_this_year, -> { where('start_date > ? AND start_date < ?', Date.today.beginning_of_year, Date.today.end_of_year) }

  #returns collection of all races open for registration
  def self.registerable
    Race.all.map do |race|
      race if race.registerable?
    end.compact
  end

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
    cutoff_date > Time.now.in_time_zone('Eastern Time (US & Canada)')
  end

  def cutoff_date
    (self.start_date.end_of_day-5.days).in_time_zone('Eastern Time (US & Canada)').end_of_day
  end

  def check_race_registrations
    if race_registrations.any?
      errors[:base] << "Cannot delete a #{self.class.name} that is associated with a current race registration. Delete race registrations and try again"
      throw :abort
    end
  end

end
