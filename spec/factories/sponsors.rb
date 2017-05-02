FactoryGirl.define do
  factory :sponsor do
    sequence :name do |n|
      "Sponsor #{n}"
    end
    sequence :image do |n|
      "sponsor_image_#{n}.jpg"
    end
    sequence :url do |n|
      "www.sponsor_#{n}.com"
    end
  end
end
