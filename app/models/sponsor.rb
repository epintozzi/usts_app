class Sponsor < ApplicationRecord
  validates :name, presence: true
  # validates :image, presence: true
  validates :name, uniqueness: {scope: [:url]}

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
