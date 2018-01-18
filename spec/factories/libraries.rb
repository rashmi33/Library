FactoryGirl.define do
  factory :library do
    name Faker::Name.first_name
    address Faker::Address.street_address
    phone_no Faker::Number.number(17)
  end
end