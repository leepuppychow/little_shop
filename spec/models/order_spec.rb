require 'rails_helper'

describe Order, type: :model do
  describe "Validations" do
    it {is_expected.to validate_presence_of(:status)}
    it {is_expected.to validate_presence_of(:total_price)}
  end

  describe "Relationships" do
    it "belongs_to user" do
      is_expected.to belong_to(:user)
    end
    
    it "has_many items" do
      is_expected.to have_many(:items)
    end
  end

  describe "Instance Methods" do
    before :each do
      @order1 = create(:order)
      @item1 = create(:item)
      @item2 = create(:item)
      @item3 = create(:item)
      OrderItem.create(order: @order1, item: @item1, original_price: @item1.price, quantity: 1, sub_total: 100.0)
      OrderItem.create(order: @order1, item: @item2, original_price: @item1.price, quantity: 1, sub_total: 100.0)
      OrderItem.create(order: @order1, item: @item3, original_price: @item1.price, quantity: 1, sub_total: 100.0)
      OrderItem.create(order: @order1, item: @item3, original_price: @item1.price, quantity: 1, sub_total: 100.0)
    end

    it "can find item_count" do
      expected = {@item1.id => 1, @item2.id => 1, @item3.id => 2}
      expect(@order1.item_count).to eq expected
    end

    it "can get item_subtotals" do
      expected = {@item1.id => 100.0, @item2.id => 100.0, @item3.id => 200.0}
      expect(@order1.item_subtotals).to eq expected
    end

    it "can get total item price" do
      expect(@order1.total_item_price).to eq 400.0
    end
  end


end
