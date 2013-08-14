# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :address, class:Address do
    address_1 "1234 My Street"
    address_2 "Apt. 2C"
    city "Gillette"
    state "WY"
    postal_code "85555"
  end

  factory :chicago_address, class:Address do
    address_1 "1060 W Addison St"
    city "Chicago"
    state "IL"
    postal_code "60613"
  end
end
