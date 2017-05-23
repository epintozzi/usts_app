FactoryGirl.define do
  factory :photo do
    photographer "Photographer Name"
    caption "Caption text"
    gallery
    image Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/image.JPG', 'image/jpg')
  end
end
