FactoryGirl.define do
  factory :member do
    name Faker::Name.first_name
    address Faker::Address.street_address
    phone_no Faker::Number.number(17)
    code 'A56fD4'
    is_author false
    association :library, factory: :library, strategy: :build
  end
end