require 'rails_helper'

describe "When a registered user is logged in" do
  describe "should be presented with a link to log out" do
    it "should log the user out" do
      user = create(:user)
      visit login_path

      fill_in "username", with: user.username
      fill_in "password", with: user.password
      click_on "Submit"

      click_on "Logout"

      expect(current_path).to eq("/")
      expect(page).to have_content("You have successfully logged out")
      expect(page).to have_no_content("Logged in as #{user.username}")
    end
  end
end
