require 'rails_helper'

describe "admin can view retired item analytics" do
  it "should show all items that have ever been retired with their information" do
    item = create(:item)
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_items_path
    click_on "Retire Item"
    click_on "Reactivate Item"
    click_on "Retire Item"
    click_on "Reactivate Item"
    click_on "Retire Item"

    visit admin_analytics_dashboard_path

    within ".retired_analytics" do
      expect(page).to have_content(item.name)
      expect(page).to have_content('retired')
      expect(page).to have_content('3')
    end
  end
end
