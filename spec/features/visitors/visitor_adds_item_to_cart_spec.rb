require 'rails_helper'

describe "unregistered user visits items index" do

  before do
    @category = create(:category)
    @item = create(:item, category: category)
    visit items_path
  end

  it "sees an add to cart button" do

    expect(page).to have_content("Add to cart")
  end

  it "should contain flash message when user adds to cart" do
    click_on "Add to cart"

    expect(page).to have_content("Added lightsaber to Cart")
  end

  context "visitor clicks on view cart" do
    it "should take user to cart show page" do

      click_on "View cart"

      expect(current_path).to eq(cart_path)
    end

    it "should show all items user has in cart" do
      click_on "Add to cart"

      click_on "View cart"

      expect(page).to have_content(@item.name)
      expect(page).to have_content(@item.price)
      expect(page).to have_content(@item.description)
      expect(page).to have_content("Total Price: #{fill_in_later}")
    end
  end
end
