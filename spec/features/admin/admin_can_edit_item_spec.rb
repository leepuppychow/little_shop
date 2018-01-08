require 'rails_helper'

describe "As an admin, when I visit /admin/dashboard" do
  describe "I can click on a link to edit an individual item" do
    it "can then click on Edit Item" do
      admin = create(:user, role: 1)
      item1 = create(:item, status: "active")
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_items_path

      click_on "Edit Item"

      expect(current_path).to eq edit_admin_item_path(item1)

      fill_in "item[name]", with: "New Item"
      fill_in "item[description]", with: "ok cool"
      click_on "Update Item"

      expect(current_path).to eq item_path(item1)
      expect(page).to have_content "New Item"
      expect(page).to have_content "ok cool"
    end
  end
end
