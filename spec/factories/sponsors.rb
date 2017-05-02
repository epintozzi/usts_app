FactoryGirl.define do
  factory :sponsor do
    sequence :name do |n|
      "Sponsor #{n}"
    end
    image "sponsor_image.jpg"
    url "www.sponsor.com"
  end
end
