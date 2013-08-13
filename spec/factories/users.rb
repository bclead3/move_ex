# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |usr|
    name     "Ben Graham"
    email    "bgraham@value.com"
    password "LockInValue"
    password_confirmation "LockInValue"

    usr.association :address

    #usr.user_attributes do |u_attr|
    #  3.times do
    #    u_attr.associate
    #  end
    #end
  end
end
