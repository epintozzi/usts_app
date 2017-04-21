FactoryGirl.define do
  factory :usts_registration do
    race_year 2017
    first_name "Erin"
    last_name "Pintozzi"
    sequence :usts_number do |n|
      "1234#{n}"
    end
    street_address "123 Main St"
    city "Denver"
    state "CO"
    zip "80216"
    email "erin@email.com"
    phone "987-654-4321"
    fax "123-456-7890"
    birthdate "1987-04-19 12:43:43"
    liability_release true
    membership_type 1
    signature "Signature text"
    association :creator, factory: :user
  end
end
