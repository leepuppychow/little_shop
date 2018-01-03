require 'rails_helper'

describe "Visitor views a page for specific category" do
  it "sees all items listed for that category" do
    category_1 = Category.create(name: "Category1")
    category_2 = Category.create(name: "Category2")
    item_1, item_2 = create_list(:item, 2, category: category_1)
    item_3, item_4 = create_list(:item, 2, category: category_2)

    visit "/#{category_1.slug}"

    expect(page).to have_content(item_1.name)
    expect(page).to have_content(item_1.price)
    expect(page).to have_content(item_2.name)
    expect(page).to have_content(item_2.price)

    expect(page).to have_no_content(item_3.name)
    expect(page).to have_no_content(item_4.name)
  end
end
