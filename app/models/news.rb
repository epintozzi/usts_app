class News < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :title, presence: true
  validates :content, presence: true
  validates :published_on, presence: true
  validates :author, presence: true

  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
