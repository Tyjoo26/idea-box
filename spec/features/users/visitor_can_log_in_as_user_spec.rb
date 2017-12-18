require "rails_helper"

describe "As a visitor" do
  describe "when i visit the root page" do
    before :each do
      visit root_path
    end
    it "displays an option for me to create account" do
      click_link("Create Account")

      expect(current_path).to eq(new_user_path)
      
      fill_in"user[user_name]", with: "funbucket13"
      fill_in"user[password]", with: "test"

      click_on "Create New User"

      expect(current_path).to eq(user_path(User.last.id))
      expect(page).to have_content("Welcome, funbucket13!")
    end
  end
end
