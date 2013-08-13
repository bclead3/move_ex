# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address do
    address_1 "1234 My Street"
    address_2 "Apt. 2C"
    city "Gillette"
    state "WY"
    postal_code "85555"
  end
end
