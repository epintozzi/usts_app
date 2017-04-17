FactoryGirl.define do
  factory :race do
    street_address "123 Lake Street"
    city "DePue"
    state "IL"
    fee_override 50
    longitude 89.3074
    latitude 41.3242
    start_date "2017-07-26 16:33:57"
    end_date "2017-07-30 16:33:57"
  end
end
