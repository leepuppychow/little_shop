require 'rails_helper'

describe "An admin is logged in" do
  describe "Admin fills out and submits a form to create a new item" do
    it "Admin sees new item" do
      user = create(:user, role: 1)
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_item_path

      expect(page).to have_content("Create A New Item")

      fill_in "item[name]", with: "ItemName"
      fill_in "item[description]", with: "Item Description"
      fill_in "item[price]", with: 300.0
      fill_in "item[image]", with: "https://upload.wikimedia.org/wikipedia/commons/1/14/Lightsaber%2C_silver_hilt%2C_blue_blade.png"
      select "#{category.name}", :from => "item[category_id]"
      choose('item_status_active')

      click_on "Create Item"

      expect(current_path).to eq(item_path(Item.all.first))
      expect(page).to have_content(Item.all.first.name)
      expect(page).to have_content(Item.all.first.description)
      expect(page).to have_content(Item.all.first.price)
      expect(page).to have_button("Add To Cart")
    end
  end
end
