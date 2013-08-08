# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
      name     "Ben Leadholm"
      email    "bclead3@yahoo.com"
      password "gobldygook"
      password_confirmation "gobldygook"
  end
end
