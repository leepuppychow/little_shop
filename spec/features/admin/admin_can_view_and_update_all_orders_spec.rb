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
      expect(page).to have_content("Order Count by Status")
      expect(page).to have_content("#{@order1.status} 1")
      expect(page).to have_content("#{@order2.status} 1")
      expect(page).to have_content("#{@order3.status} 1")
    end

    describe "admin changes the status of an order" do
      it "order is changed from 'ordered' to 'paid'" do
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit admin_dashboard_path

        expect(page).to have_no_content("Paid")

        click_button "Mark as paid"

        expect(current_path).to eq(admin_dashboard_path)
        expect(page).to have_content("Paid")
      end
    end

    describe "admin selects a status from the filter" do
      it "only sees orders with that status" do
        @order2.status = "Ordered"
        @order2.save
        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
        visit admin_dashboard_path

        select "Ordered", :from => "status"
        click_button "Submit"

          within '.order-table' do
            expect(page).to have_content(@order1.id)
            expect(page).to have_content(@order1.status)
            expect(page).to have_content(@order1.total_item_price)
            expect(page).to have_content(@order2.id)
            expect(page).to have_content(@order2.status)
            expect(page).to have_content(@order2.total_item_price)
            expect(page).to have_no_content(@order3.id)
            expect(page).to have_no_content(@order3.status)
            expect(page).to have_no_content(@order3.total_item_price)
          end

      end
    end
  end
end
