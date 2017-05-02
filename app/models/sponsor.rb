class Sponsor < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates_uniqueness_of :name, :scope => :url
end
