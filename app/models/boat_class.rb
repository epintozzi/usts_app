class BoatClass < ApplicationRecord
  acts_as_paranoid

  has_many :race_registrations
  has_many :race_results

  before_destroy :check_race_registrations, on: :destroy

  validates :class_name, presence: true, uniqueness: true
  validates :registration_fee, presence: true

  def check_race_registrations
    if race_registrations.any?
      errors[:base] << "Cannot delete a #{self.class.name} that is associated with a current race registration. Delete race registrations and try again"
      throw :abort
    end
  end
end
