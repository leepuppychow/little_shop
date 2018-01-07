require 'rails_helper'

describe "As an admin when I visit /admin/dashboard" do
  it "will see an admin dashboard page" do
    user = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit "/admin/dashboard"

    expect(page).to have_content "Admin Dashboard"
  end
end
