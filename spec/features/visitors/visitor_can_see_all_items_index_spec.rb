require 'rails_helper'

describe "Visitor views the item index" do
  it "sees all items listed on one page" do
    category = create(:category)
    item_1, item_2 = create_list(:item, 2, category: category)
    visit items_path

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)
  end
end
