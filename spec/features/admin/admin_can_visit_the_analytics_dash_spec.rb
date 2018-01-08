require 'rails_helper'

describe "when an admin visits the admin dashboard" do
  before :each do
    @admin = create(:user, role: 1)
    @category1 = create(:category)
    @category2 = create(:category, name: "Jedi")
    @item1 = create(:item, category: @category1, price: 600.0)
    @item2 = create(:item, category: @category1)
    @item3 = create(:item, category: @category2, price: 700.0)
    @item4 = create(:item, category: @category2)
    @item5 = create(:item, category: @category2)
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

  it "should show when the highest priced item for each category and orders for that category" do
    visit admin_analytics_dashboard_path

    expect(page).to have_content("Highest priced item for #{@category1.name}: $#{@item1.price}")
    expect(page).to have_content("Highest priced item for #{@category2.name}: $#{@item3.price}")
  end
end
