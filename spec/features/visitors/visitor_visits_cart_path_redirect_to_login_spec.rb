require 'rails_helper'

describe "As a visitor when I visit the /cart path" do
  describe "I should not see an option to Checkout" do
    describe "I should see option to Login or Create Account to Checkout" do
      it "I can then create an account and see all items in my cart" do
        item = create(:item)
        user = create(:user)

        visit items_path

        click_on "Add To Cart"
        click_on "Add To Cart"

        click_on "View Cart"

        expect(page).to have_content "Login or Create Account to Checkout"

        click_on "Login or Create Account to Checkout"

        expect(current_path).to eq login_path

        fill_in "username", with: user.username
        fill_in "password", with: user.password
        click_on "Submit"

        expect(current_path).to eq dashboard_path
        click_on "Cart"

        expect(page).to have_content item.name
        expect(page).to have_content item.description
        expect(page).to have_content item.price
        expect(page).to have_content "Count: 2"
        expect(page).to have_content "Subtotal: $200.00"
      end
    end
  end
end
