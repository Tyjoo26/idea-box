require 'rails_helper'

describe "As a verified Admin" do
  describe "When I go categories/new" do
    it "displays a form field that allows me to create a new category and redirects me to a category index page" do
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_category_path


      fill_in"category[name]", with: "Terrible IDEAS"
      click_on("Create Category")

      expect(current_path).to eq(admin_category_path(Category.last.id))
      expect(page).to have_content("Terrible IDEAS")
    end
  end
end

describe "As a default user" do
  describe "when i go to categories new" do
    xit "should display a 404 error" do
      user = create(:user)
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_category_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end
  end
end
