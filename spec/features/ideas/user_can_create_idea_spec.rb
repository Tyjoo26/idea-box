require 'rails_helper'

describe 'As a user' do
  describe 'I can go to my user account and I click the link to create idea' do
    it 'will take me to /ideas/new and will display a form with an option to create account' do
      category = create(:category)

      visit new_category_idea_path(category)

      fill_in"idea[title]", with: "FLYING CARS"
      select("Idiotic Ideas", from: "idea_category_id").select_option

      click_on("Create Idea")

      expect(current_path).to eq(category_idea_path(category, Idea.last.id))

      expect(page).to have_content("FLYING CARS")

      expect(page).to have_content("Idiotic Ideas")
    end
  end
end
