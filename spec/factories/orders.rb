FactoryBot.define do
  factory :order do
    status "Ordered"
    total_price 350.00
    created_at Date.today
    updated_at Date.today
    user
  end
end
