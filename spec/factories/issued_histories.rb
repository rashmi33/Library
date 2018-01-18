FactoryGirl.define do
  factory :issued_history do
    issue_type 'rent'
    date_of_issue Faker::Date.forward(100)
    date_of_return Faker::Date.forward(100)
    issued_no Faker::Number.number(2)
    association :book, factory: :book, strategy: :build
    association :member, factory: :member, strategy: :build
  end
end