require 'rails_helper'

describe "when an admin visits the admin dashboard" do
  before :each do
    @admin = create(:user, role: 1)
    @order1 = create(:order, user: @admin)
    @order2 = create(:order, user: @admin)
    @order3 = create(:order, user: @admin)
    @user = create(:user)
    @order4 = create(:order, user: @user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
  end

  it "should present them with a link to the analytics dashboard" do
    visit admin_dashboard_path

    expect(page).to have_content("Analytics Dashboard")
    click_on "Analytics Dashboard"

    expect(current_path).to eq(admin_analytics_dashboard_path)
    expect(page).to have_content("Analytics Dashboard")
  end

  it "should show the user with the most orders" do
    visit admin_analytics_dashboard_path
    expect(page).to have_content("#{@admin.username} has the most orders with 3")
  end
end
