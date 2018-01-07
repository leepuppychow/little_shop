require 'rails_helper'

describe "when an admin visits the admin dashboard" do
  it "should present them with a link to the analytics dashboard" do
    admin = create(:user, role: 1)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)
    visit admin_dashboard_path

    expect(page).to have_content("Analytics Dashboard")
    click_on "Analytics Dashboard"

    expect(current_path).to eq(admin_analytics_dashboard_path)
    expect(page).to have_content("Analytics Dashboard")
  end
end
