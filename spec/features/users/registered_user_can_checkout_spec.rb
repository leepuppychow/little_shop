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

      # Then the order should be placed
      # And my current page should be “/orders”
      expect(current_path).to eq(orders_path)
      # And I should see a message “Order was successfully placed”
      # And I should see the order I just placed in a table
      expect(page).to have_content("#{Order.last.id}")
      expect(page).to have_content("Order was successfully placed")
      # save_and_open_page
      expect(page).to have_content(Order.last.total_price)
    end
  end
end
