# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email  { |n|  "user-#{n}@example.com"}
    password { |n| "pass-#{n}" }
    password_confirmation { |n| "pass-#{n}" }
  end
end
