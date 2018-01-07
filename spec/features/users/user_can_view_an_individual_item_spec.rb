require "rails_helper"

describe "A visitor views an individual item" do
  it "visitor sees that item's information" do
    item1, item2 = create_list(:item, 2)

    visit item_path(item1)

    expect(current_path).to eq(item_path(item1))
    expect(page).to have_content(item1.name)
    expect(page).to have_content(item1.description)
    expect(page).to have_content(item1.price)
    expect(page).to have_selector(:link_or_button, "Add To Cart")
    # expect(page).to have_button("Add To Cart")
    expect(page).to have_no_content(item2.name)
  end
end
