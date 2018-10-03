FactoryBot.define do
  factory :news do
    title { "News Title" }
    content { "News Title" }
    image { Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/image.JPG', 'image/jpg') }
    published_on { "2017-04-19" }
    association :author, factory: :user
  end
end
