class Photo < ApplicationRecord
  belongs_to :gallery

  validates :gallery, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "missing.png"
  validates_attachment_presence :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def next
    Photo.where("id > ?", id).limit(1).first
  end

  def previous
    Photo.where("id < ?", id).limit(1).first
  end
end
