FactoryBot.define do
  factory :race_result do
    driver_name "Driver Name"
    points 1.5
    usts_number '12345'
    boat_class
    race
  end
end
