require 'rails_helper'

describe "An item is retired" do
  describe "visitor views item show page" do
    it "sees 'retired' instead of 'add to cart'" do
      category = create(:category)
      item = create(:item, status: "retired")
      visit item_path(item)

      expect(page).to have_content(item.name)
      expect(page).to have_content(item.price)
      expect(page).to have_content(item.description)
      expect(page).to have_content("Item Retired")
      expect(page).to have_no_content("Add To Cart")
    end
  end

  describe "visitor views item index page" do
    it "sees retired items and active items" do
      category = create(:category)
      item_1 = create(:item, status: "retired")
      item_2 = create(:item)
      visit items_path
      save_and_open_page

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_1.price)
      expect(page).to have_content("Item Retired")
      expect(page).to have_content(item_2.name)
      expect(page).to have_content(item_2.price)
      expect(page).to have_button("Add To Cart")
    end
  end
end
