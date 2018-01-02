FactoryBot.define do
  factory :item do
    sequence(:name) {|n| "Item#{n}"}
    description "Fake Description"
    price 100
    image "Image_URL"
    category
  end
end
