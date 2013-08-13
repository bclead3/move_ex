# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      name     "Ben Graham"
      email    "bgraham@value.com"
      password "LockInValue"
      password_confirmation "LockInValue"
  end
end
