FactoryGirl.define do
  factory :attr1, class:UserAttribute do
    key "one"
    value 1
    position 1
  end

  factory :attr2, class:UserAttribute do
    key "two"
    value 2
    position 2
  end

  factory :attr3, class:UserAttribute do
    key "three"
    value 3
    position 3
  end

  factory :fred, class:UserAttribute do
    key "fred"
    value "The Fred"
    position 4
  end

  factory :barney, class:UserAttribute do
    key "barney"
    value "The Barney"
    position 5
  end

end