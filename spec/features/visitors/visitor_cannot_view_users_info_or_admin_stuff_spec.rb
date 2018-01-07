require 'rails_helper'

describe "As a visitor (unauthenticated user)" do
  describe "when I visit another user's order show page" do
    before :each do
      @user1 = create(:user)
      @user2 = create(:user, username: "Gabe")
      @order1 = create(:order, user: @user1)
      @order2 = create(:order, status: "pending", user: @user2)
    end

    it "should render a 404 page not found message" do
      visit order_path(@order1)
      expect(page).to have_content("The page you were looking for doesn't exist")

      visit "/users/#{@user1.id}"
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
