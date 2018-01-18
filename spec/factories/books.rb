FactoryGirl.define do
  factory :book do
    name Faker::Name.first_name
    author Faker::Name.first_name
    code 'df56G7'
    price Faker::Number.decimal(5, 2)
    version Faker::Number.decimal(2, 3)
    no_of_copies Faker::Number.number(3)
    association :library, factory: :library, strategy: :build
    association :category, factory: :category, strategy: :build
  end
end