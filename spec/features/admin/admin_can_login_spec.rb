require 'rails_helper'

describe "When an admin logs in" do
  it "should redirect them to the admin dashboard page" do
    user = create(:user, role: 1)

    visit root_path
    click_on "Login"

    fill_in "username", with: user.username
    fill_in "password", with: user.password
    # save_and_open_page
    click_on "Submit"

    expect(current_path).to eq(admin_dashboard_path)
    expect(page).to have_content("Admin Dashboard")
  end
  # As an Admin When I log in Then I am redirected to “/admin/dashboard”
end
