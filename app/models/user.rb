class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :race_registrations

  has_attached_file :image, styles: {
    medium: "300x300>",
    thumb: "100x100>" }, default_url: "profile_avatar.png"

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  enum role: [:normal, :editor, :admin]
end
