FactoryBot.define do
  factory :user do
    name { "Test User" }
    email { "test@example.com" }
    password_digest { "password" }
  end
end
