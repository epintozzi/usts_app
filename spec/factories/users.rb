FactoryGirl.define do
  factory :user do
    first_name "First"
    last_name "Last"
    email "erin@email.com"
    password "password"
    # password_confirmation "MyText"
    driver? false
    role 0
  end
end
