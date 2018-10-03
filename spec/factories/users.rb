FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password { "password" }
    password_confirmation { "password" }
    driver { false }
    role { 0 }
    image { Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/image.JPG', 'image/jpg') }
  end
end
