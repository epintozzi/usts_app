FactoryGirl.define do
  factory :race do
    title "Race for the Kids"
    street_address "123 Lake Street"
    city "DePue"
    state "IL"
    fee_override 50
    longitude 89.3074
    latitude 41.3242
    start_date Date.today+7
    end_date Date.today+9
    sanction Rack::Test::UploadedFile.new(Rails.root() + 'spec/assets/sanction.pdf', 'application/pdf')
    details "These are details about the race"
    hotel_information "This is hotel information about the race"
  end
end
