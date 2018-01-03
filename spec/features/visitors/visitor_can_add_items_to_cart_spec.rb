require 'rails_helper'

describe "As a visitor when I visit any page with an item on it" do
  describe "I should see a link for Add To Cart" do
    it "will display a message that item was added to cart successfully" do
      item = create(:item)

      visit items_path

      click_on "Add To Cart"

      expect(page).to have_content("#{item.name} was added to your cart!")
    end
  end

  describe "When I click on View Cart" do
    it "should take me to a Cart view with all items I have added" do
      skip
      item = create(:item)
      cart = Cart.new({"#{item.id}" => 2})

      visit cart_path

      expect(page).to have_content "My Cart"
      expect(page).to have_content item.name
      expect(page).to have_content item.description
      expect(page).to have_content item.price
      expect(page).to have_content "Total Cost: #{cart.total_cost}"
      expect(cart.total_items).to eq 2
    end
  end
end
