require 'rails_helper'

describe "As an admin, when I visit /admin/dashboard" do
  describe "I can click on a link for the item index" do
    it "should take me to an item index page" do
      admin = create(:user, role: 1)
      item1 = create(:item, status: "active")
      item2 = create(:item, status: "retired")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_dashboard_path

      click_on "Item Index"

      expect(current_path).to eq admin_items_path
      expect(page).to have_content(item1.name)
      expect(page).to have_content(item2.name)
      expect(page).to have_content(item1.description)
      expect(page).to have_content(item2.description)
      expect(page).to have_content(item1.status)
      expect(page).to have_content(item2.status)
      expect(find_link("#{item1.name}").visible?).to eq true
      expect(find_link("#{item2.name}").visible?).to eq true
      expect(page).to have_content "Edit Item"
      expect(page).to have_content "Retire Item"
      expect(page).to have_content "Reactivate Item"
    end

    it "can retire an active item" do
      admin = create(:user, role: 1)
      item1 = create(:item, status: "active")
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_items_path

      click_on "Retire Item"

      expect(current_path).to eq item_path(item1)
      expect(page).to have_content "Retired"
      expect(page).to have_content item1.name
    end

    it "can reactivate a retired item" do
      admin = create(:user, role: 1)
      item1 = create(:item, status: "retired")
      category = create(:category)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_items_path

      click_on "Reactivate Item"

      expect(current_path).to eq item_path(item1)
      expect(page).to have_button "Add To Cart"
      expect(page).to have_content item1.name
    end
  end
end
