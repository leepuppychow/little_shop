require 'rails_helper'

describe "As a visitor when I visit my cart with items in it" do
    before (:each) do
      @item = create(:item)
      visit items_path
      click_on "Add To Cart"
      click_on "Add To Cart"
    end

  describe "I should see a link for remove item from Cart" do
    it "will display a message that item was removed from the cart successfully" do
      visit "/cart"

      expect(page).to have_content("Remove Item")

      click_link "Remove Item"

      expect(page).to have_content("#{@item.name} was removed from your cart!")
      expect(current_path).to eq("/cart")

      visit "/cart"

      expect(page).to have_no_content(@item.name)
    end
  end

  describe "When I increase the quantity of an item" do
    it "the change should be reflected in my cart" do
      visit "/cart"

      expect(page).to have_content(@item.name)
      expect(page).to have_content("Count: 2")

      fill_in "quantity", with: 5
      click_button "Update"

      expect(current_path).to eq("/cart")
      expect(page).to have_content(@item.name)
      expect(page).to have_content("Count: 5")
      expect(page).to have_content("Total Cost: $500.00")
    end
  end

  describe "When I decrease the quantity of an item" do
    it "the change should be reflected in my cart" do
      visit "/cart"

      expect(page).to have_content(@item.name)
      expect(page).to have_content("Count: 2")

      fill_in "quantity", with: 1
      click_button "Update"

      expect(current_path).to eq("/cart")
      expect(page).to have_content(@item.name)
      expect(page).to have_content("Count: 1")
      expect(page).to have_content("Total Cost: $100.00")
    end
  end
end
