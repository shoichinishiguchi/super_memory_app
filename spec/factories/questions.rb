FactoryBot.define do
  factory :question do
    title "test"
    question "What is this?"
    answer "It's a hot dog!"
    correct_cnt 0
    wrong_cnt 0
    association :user
  end
end
