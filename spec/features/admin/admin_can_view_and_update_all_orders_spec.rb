require 'rails_helper'

describe "An admin is logged in" do
  describe "Admin views the admin dashboard" do
    before do
    @user = create(:user, role: 1)
    @category = create(:category)
    @item1, @item2, @item3 = create_list(:item, 3, category: @category)
    @order1 = create(:order)
    @order2 = create(:order, status: "Cancelled")
    @order3 = create(:order, status: "Completed")
    @order1.items << [@item1, @item2, @item3]
    @order2.items << [@item2, @item3]
    @order3.items << [@item1]
  end

    it "Admin sees all orders with statuses" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
      visit admin_dashboard_path

      within '.order-table' do
        expect(page).to have_content(@order1.id)
        expect(page).to have_content(@order1.status)
        expect(page).to have_content(@order1.total_item_price)
        expect(page).to have_content(@order2.id)
        expect(page).to have_content(@order2.status)
        expect(page).to have_content(@order2.total_item_price)
        expect(page).to have_content(@order3.id)
        expect(page).to have_content(@order3.status)
        expect(page).to have_content(@order3.total_item_price)
      end
    end
  end
end
