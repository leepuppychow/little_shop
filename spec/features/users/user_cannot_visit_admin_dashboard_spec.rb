require 'rails_helper'

describe "registered user cannot visit an admins dashboard page" do
  it "should render a 404 when a user visits an admin page" do
    user = create(:user)
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit admin_dashboard_path

    expect(page).to have_content("The page you were looking for doesn't exist")
  end

it "should render a 404 when an unregistered uses visits an admin page" do
  visit admin_dashboard_path

  expect(page).to have_content("The page you were looking for doesn't exist")
end

end
