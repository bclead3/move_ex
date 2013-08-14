# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user, class:User do |usr|
    usr.name     "Ben Graham"
    usr.email    "bgraham@value.com"
    usr.password "LockInValue"
    usr.password_confirmation "LockInValue"

    usr.association :address

    usr.user_attributes do |ua|
      [:attr1, :attr2, :attr3].map do |name|
        ua.association( name )
      end
    end
  end

  factory :user2, class:User do |usr|
    usr.name     "Milton Friedman"
    usr.email    "miltonf@cuhicago.edu"
    usr.password "Monitarist"
    usr.password_confirmation "Monitarist"

    usr.address { |addr| addr.association :chicago_address }

    usr.user_attributes do |ua|
      [:fred, :barney].map do |name|
        ua.association( name )
      end
    end
  end
end
