FactoryGirl.define do
  factory :news do
    title "News Title"
    content "News Content"
    image "image.jpg"
    association :author, factory: :user
  end
end
