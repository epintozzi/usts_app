class News < ApplicationRecord
  belongs_to :author, class_name: "User"

  validates :title, presence: true
  validates :content, presence: true
  validates :published_on, presence: true
end
