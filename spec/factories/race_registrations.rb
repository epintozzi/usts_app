FactoryBot.define do
  factory :race_registration do
    paid 1
    boat_number "V26"
    boat_owner "Erin Pintozzi"
    boat_owner_zip "80216"
    boat_name "The red racer"
    emergency_contact "Brad Barth"
    emergency_phone "987-654-4321"
    emergency_contact_at_race 1
    race
    boat_class
    usts_registration
    association :creator, factory: :user
  end
end
