require 'rails_helper'

describe Order, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:status)}
    it {is_expected.to validate_presence_of(:total_price)}
    it {is_expected.to validate_presence_of(:created_at)}
    it {is_expected.to validate_presence_of(:updated_at)}
  end

 describe "Relationships" do
    it "belongs_to user" do
      is_expected.to belong_to(:user)
    end

    # it "has_many items through order_items" do
    #   is
    # end
  end
end
