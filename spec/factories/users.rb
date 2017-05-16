FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
    driver false
    role 0
    image Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/image.JPG', 'image/jpg')
  end
end
