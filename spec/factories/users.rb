FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
    driver? false
    role 0
    image "image.jpg"
  end
end
