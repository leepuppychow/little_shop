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
      item = create(:item)

      visit items_path

      click_on "Add To Cart"
      click_on "Add To Cart"

      visit cart_path

      expect(page).to have_content "My Cart"
      expect(page).to have_content item.name
      expect(page).to have_content item.description
      expect(page).to have_content "Subtotal: $200.00"
      expect(page).to have_content "$100.00"
      expect(page).to have_content "Count: 2"
      expect(page).to have_content "Total Cost: $200.00"
    end
  end
end
