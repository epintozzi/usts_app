FactoryBot.define do
  factory :boat_class do
    sequence :class_name do |n|
      "Class #{n}"
    end
    registration_fee { 1.50 }
  end
end
