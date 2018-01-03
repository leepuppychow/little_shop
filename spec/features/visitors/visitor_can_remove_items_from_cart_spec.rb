require 'rails_helper'

describe "As a visitor when I visit my cart with items in it" do
    before (:each) do
      @item = create(:item)
      visit items_path
      click_on "Add To Cart"
    end

  describe "I should see a link for remove item from Cart" do
    it "will display a message that item was removed from the cart successfully" do
      visit "/cart"

      expect(page).to have_content("Remove Item")

      click_link "Remove Item"

      expect(page).to have_content("#{@item.name} was removed from your cart!")
      expect(current_path).to eq("/cart")
    end
  end

  describe "When I click on View Cart" do
    xit "should take me to a Cart view with all items I have added" do
      item = create(:item)

      visit items_path

      click_on "Add To Cart"
      click_on "Add To Cart"

      visit cart_path

      expect(page).to have_content "My Cart"
      expect(page).to have_content item.name
      expect(page).to have_content item.description
      expect(page).to have_content "$100.00"
      expect(page).to have_content "Count: 2"
      expect(page).to have_content "Total Cost: $200.00"
    end
  end
end
