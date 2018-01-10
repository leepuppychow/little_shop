require 'rails_helper'

describe "when an admin visits the admin dashboard" do
  before :each do
    @admin = create(:user, role: 1)
    @user = create(:user, state: "CA")
    @category1 = create(:category)
    @category2 = create(:category, name: "Jedi")
    @item1 = create(:item, category: @category1, price: 600.0)
    @item2 = create(:item, category: @category1)
    @item3 = create(:item, category: @category2, price: 700.0)
    @item4 = create(:item, category: @category2)
    @item5 = create(:item, category: @category2)
    @order1 = create(:order, user: @admin, status: "Completed")
    @order2 = create(:order, user: @admin)
    @order3 = create(:order, user: @admin, status: "Completed")
    @order4 = create(:order, user: @user, status: "Completed")

    @order1.items << [@item1, @item2]
    @order2.items << [@item1, @item1, @item3, @item4, @item4]
    @order3.items << [@item1, @item2, @item3, @item4, @item5]
    @order4.items << [@item2,@item2,@item5,@item5,@item5]
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

    expect(page).to have_content @category1.highest_priced_item.name
    expect(page).to have_content @category2.highest_priced_item.name
    expect(page).to have_content @category1.highest_priced_item.price
    expect(page).to have_content @category2.highest_priced_item.price
  end

  it "should show breakdown number of orders per category" do
    visit admin_analytics_dashboard_path

    expect(page).to have_content "Orders per category"
    expect(page).to have_content @category1.number_of_orders_for_category
    expect(page).to have_content @category2.number_of_orders_for_category
  end

  it "should show a state by state breakdown of completed orders and sort by state" do
    visit admin_analytics_dashboard_path

    expect(page).to have_content "Orders by State"

    within ".orders_by_state" do
      expect(page).to have_content "CO"
      expect(page).to have_content "2"
    end
  end
end
