FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.sentence }
    spoiler { true }
    category { Category.all.sample }
    association :user
  end
end
