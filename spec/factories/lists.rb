FactoryBot.define do
  factory :list do           
    name              { Faker::Name.initials(number: 2) }
    detail            { Faker::Lorem.sentence }
    category_id       { 2 }
    status_id         { 2 }
    shipping_fee_id   { 2 }
    location_id       { 2 }
    shipping_date_id  { 2 }
    price             { Faker::Number.number(digits: 6) }
    association :user

    after(:build) do|list|
      list.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
