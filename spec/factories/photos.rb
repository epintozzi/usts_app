FactoryGirl.define do
  factory :photo do
    photographer "MyText"
    caption "MyText"
    gallery
    image Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/image.JPG', 'image/jpg')
  end
end
