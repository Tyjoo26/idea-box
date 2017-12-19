require 'rails_helper'

describe "As an admin" do
  describe "I can delete a category " do
    it "will display the index page without the category" do

      category = create(:category)
      admin = create(:user, role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit admin_categories_path

      click_link("Delete Category")

      expect(current_path).to eq(admin_categories_path)

      expect(page).to_not have_content("Idiotic Ideas")
      
    end
  end
end
