FactoryBot.define do
  factory :boat_class do
    class_name { "#{Faker::Lorem.word}-#{rand(1..100)}" }
    registration_fee { 1.50 }
  end
end
