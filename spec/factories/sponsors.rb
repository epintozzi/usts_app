FactoryBot.define do
  factory :sponsor do
    sequence :name do |n|
      "Sponsor #{n}"
    end
    image Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/image.JPG', 'image/jpg')
    sequence :url do |n|
      "www.sponsor_#{n}.com"
    end
  end
end
