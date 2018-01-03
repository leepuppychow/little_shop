require 'rails_helper'

describe Cart do
  before(:each) do
    @item1 = create(:item)
    @item2 = create(:item, price: 50.0)
    @cart = Cart.new({@item1.id.to_s => 2,
                      @item2.id.to_s => 3})
  end

  it "can calculate total cost" do
    expect(@cart.total_cost).to eq 350.0
  end

end
