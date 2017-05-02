FactoryGirl.define do
  factory :race do
    title "Race for the Kids"
    street_address "123 Lake Street"
    city "DePue"
    state "IL"
    fee_override 50
    longitude 89.3074
    latitude 41.3242
    start_date "2017-07-26 16:33:57"
    end_date "2017-07-30 16:33:57"
    sanction "santion.pdf"
    details "These are details about the race"
    hotel_information "This is hotel information about the race"
  end
end
