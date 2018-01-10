require 'rails_helper'

describe "a registered user can checkout an order" do
  context "when a visitor adds items to their cart" do
    it "should allow user to place an order" do
      item = create(:item)
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit items_path

      click_on "Add To Cart"
      click_on "Add To Cart"

      visit cart_path
      click_on "Checkout"

      expect(current_path).to eq(orders_path)
      expect(page).to have_content("#{Order.last.id}")
      expect(page).to have_content("Order was successfully placed")
      expect(page).to have_content(Order.last.total_item_price)
    end
  end
end
