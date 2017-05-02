class Sponsor < ApplicationRecord
  validates :name, presence: true
  validates :image, presence: true
  validates :name, uniqueness: {scope: [:url]}
end
