FactoryBot.define do
  factory :user do
    name "TestUser"
    sequence(:email){ |n| "tester1006#{n}@example.com"}
    password "123456"

    trait :another_user do
      name "TestUser2"
      email "another_tester@example.com"
      password "123456"
    end
  end
end
