FactoryBot.define do
  factory :race do
    sequence :title do |n|
      "Race Title #{n}"
    end
    sequence :street_address do |n|
      "#{n}123 Lake St"
    end
    sequence :city do |n|
      "City Name#{n}"
    end
    state { "IL" }
    fee_override { 50 }
    longitude { 89.3074 }
    latitude { 41.3242 }
    start_date { Date.today + 7 }
    end_date { Date.today + 9 }
    sanction { Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/sanction.pdf', 'application/pdf') }
    details { "These are details about the race" }
    hotel_information { "This is hotel information about the race" }

    trait :this_year_upcoming do
      start_date { Date.today + 7 }
      end_date { Date.today + 9 }
    end
    trait :this_year_past do
      start_date { Date.today - 7 }
      end_date { Date.today - 4 }
    end
    trait :last_year do
      start_date { Date.current.last_year - 3 }
      end_date { Date.current.last_year - 1 }
    end
  end
end
