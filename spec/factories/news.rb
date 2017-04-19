FactoryGirl.define do
  factory :news do
    title "News Title"
    content "News Content"
    image "image.jpg"
    published_on "2017-04-19"
    association :author, factory: :user
  end
end
