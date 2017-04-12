FactoryGirl.define do
  factory :user do
    first_name "MyText"
    last_name "MyText"
    email "MyText"
    password "MyText"
    # password_confirmation "MyText"
    driver? false
    role 1
  end
end
