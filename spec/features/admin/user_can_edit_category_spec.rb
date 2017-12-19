require 'rails_helper'

describe "as an admin" do
  describe "I can edit a category from the index page" do
    it "will display a form field and a submit button" do

    category = create(:category)
    admin = create(:user, role: 1)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

    visit admin_categories_path

    click_link("Edit Category")

    expect(current_path).to eq(edit_category_path(category))

    fill_in"category[name]", with: "BAD IDEA"
    click_link("Edit")

    expect(current_path).to eq(admin_category_path(category))
    expect(page).to have_content("BAD IDEA")
    end
  end
end
