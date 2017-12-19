require "rails_helper"

describe "As a user" do
  describe "I cannot access, edit, or delete another users ideas" do
    before :each do
      @user = User.create(user_name: "123", password: "123", role: 0)
      @user_2 = User.create(user_name: "345", password: "234", role: 0)
      @category_1 = Category.create(name: "BAD IDEA")
      @category_2 = Category.create(name: "GREAT IDEA")

      visit root_path

      click_link("Login")
    end
    it "will only display my logged in users info" do
      fill_in'user_name', with: "123"
      fill_in'password', with: "123"

      click_on("Log In")

      expect(current_path).to eq(user_path(@user))

      visit user_path(@user_2)

      expect(page).to have_content("The page you were looking for doesn't exist")

    end
  end
end
