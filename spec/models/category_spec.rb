require 'rails_helper'

describe Category, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:name)}
  end

  describe "Relationships" do
    it {is_expected.to have_many(:items)}
  end

  describe "Instance Methods" do
    it "can find the number of orders for a category" do
      @admin = create(:user, role: 1)
      @user = create(:user)
      @category1 = create(:category)
      @category2 = create(:category, name: "Jedi")
      @item1 = create(:item, category: @category1, price: 600.0)
      @item2 = create(:item, category: @category1)
      @item3 = create(:item, category: @category2, price: 700.0)
      @item4 = create(:item, category: @category2)
      @item5 = create(:item, category: @category2)
      @order1 = create(:order, user: @admin)
      @order2 = create(:order, user: @admin)
      @order3 = create(:order, user: @admin)
      @order4 = create(:order, user: @user)

      @order1.items << [@item1, @item2,@item3]
      @order2.items << [@item1,@item4,@item4]
      @order3.items << [@item1, @item2]
      @order4.items << [@item1]

      expect(@category1.number_of_orders_for_category).to eq 4
      expect(@category2.number_of_orders_for_category).to eq 2
    end

  end

end
