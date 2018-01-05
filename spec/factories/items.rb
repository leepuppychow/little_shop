FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "Item#{n}"}
    description "Fake Description"
    price 100
    image "https://i.pinimg.com/originals/d7/9f/d5/d79fd50d3eb1c1e6cb0af809560b81de.png"
    category
  end
end
