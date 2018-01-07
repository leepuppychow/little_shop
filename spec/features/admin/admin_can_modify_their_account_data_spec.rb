require 'rails_helper'

describe "an admin can modify their own account information" do
  context "when an admin visits the dashbboard" do
    it "should present them with a link to edit their account" do
      admin = create(:user, role: 1)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
      visit admin_dashboard_path

      expect(page).to have_content("Edit Account Information")
      click_on "Edit Account Information"

      expect(current_path).to eq(admin_edit_path)
      fill_in "user[username]", with: "Lee"
      fill_in "user[password]", with: "1234"
      click_on "Update Admin"

      expect(current_path).to eq(admin_dashboard_path)
      expect(admin.username).to eq("Lee")
      expect(admin.password).to eq("1234")
    end
  end
end
