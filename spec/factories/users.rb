FactoryBot.define do
  factory :user do
    name { "test" }
    email { "test@test.com" }
    password = "password1234"
    password { password }
    password_cofirmation { password }
  end
end
