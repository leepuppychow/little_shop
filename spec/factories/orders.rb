FactoryBot.define do
  factory :order do
    status "Complete"
    total_price 350.00
    address "123 Turing Way"
    created_at Date.today
    updated_at Date.today
    user
  end
end
