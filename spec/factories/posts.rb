FactoryBot.define do
  factory :post do
    title { "タイトル" }
    content { "内容" }
    spoiler { true }
    category { Category.all.sample }
    association :user
  end
end
