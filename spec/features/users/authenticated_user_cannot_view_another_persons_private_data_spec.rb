require 'rails_helper'

describe "authenticated user cannot view another persons data" do
  before :each do
    @user1 = create(:user)
    @user2 = create(:user, username: "Gabe")
    @order1 = create(:order, user: @user1)
    @order2 = create(:order, status: "pending", user: @user2)
  end

  context "when a registered user visits a page not their own" do
    it "should render a 404 page not found message" do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user1)

      visit dashboard_path
      expect(page).to have_content("Dashboard for #{@user1.username}")

      visit "/users/#{@user2.id}"

      expect(page).to have_no_content(@user2.username)
      expect(page).to have_no_content("Dashboard for #{@user2.username}")
    end
  end
end
