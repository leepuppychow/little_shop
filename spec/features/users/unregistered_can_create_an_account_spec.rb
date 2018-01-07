require 'rails_helper'

describe "unregistered user can create an account" do
  context 'when a visitor visits the root page' do
    it "should present them with an index to create a new account" do
      visit root_path

      find(:css, 'i#nav_bar_link.fa.fa-user-circle-o.fa-2x').click
      click_on "Login"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Create Account")
      click_on "Create Account"

      expect(current_path).to eq(new_user_path)
      fill_in "user[full_name]", with: "Killa Cam"
      fill_in "user[address]", with: "123 Turing Way"
      fill_in "user[username]", with: "KillaCam"
      fill_in "user[password]", with: "password"
      click_on "Sign up"

      expect(page).to have_content("KillaCam was created")
      expect(current_path).to eq(dashboard_path)
      expect(page).to have_no_content("Login")
    end
  end
end
