FactoryGirl.define do
  factory :attr1, class:UserAttribute do
    key "one"
    value 1
  end

  factory :attr2, class:UserAttribute do
    key "two"
    value 2
  end

  factory :attr3, class:UserAttribute do
    key "three"
    value 3
  end

  factory :fred, class:UserAttribute do
    key "fred"
    value "The Fred"
  end

  factory :barney, class:UserAttribute do
    key "barney"
    value "The Barney"
  end

end