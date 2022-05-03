FactoryBot.define do
  factory :user do
    email { Faker::Internet.email}
    password {"123456"}
  end
end

FactoryBot.define do
  factory :product do
    product_name {"iPhone 13 Pro Max"}
    price {129900}
    description {"A dramatically more powerful camera system"}
    association :user
  end
end
