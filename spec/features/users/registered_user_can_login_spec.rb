require 'rails_helper'

describe "when a registered user visits the root page" do
  it "should be presented with a link to login" do
    user = create(:user)
    visit root_path

    find(:css, 'i#nav_bar_link.fa.fa-user-circle-o.fa-2x').click
    click_on "Login"

    expect(current_path).to eq(login_path)

    fill_in "username", with: user.username
    fill_in "password", with: user.password
    click_on "Submit"

    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content("Logged in as #{user.username}")
    expect(page).to have_no_content("Login")
  end
end
