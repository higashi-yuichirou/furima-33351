FactoryBot.define do
  factory :purchase_address do
    post_code     {"888-3333"}
    area          {2}
    city          {"札幌市"}
    city_number   {"札幌1-1-1"}
    building_name {"札幌ハイツ"}
    phone_number  {11111111111}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
