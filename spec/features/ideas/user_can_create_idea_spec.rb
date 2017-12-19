require 'rails_helper'

describe 'As a user' do
  describe 'I can go to my user account and I click the link to create idea' do
    it 'will take me to /ideas/new and will display a form with an option to create account' do
      category = create(:category)
      user = create(:user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      click_link("Create New Idea")

      expect(current_path).to eq(new_user_idea_path(user))
      visit new_user_idea_path(user)

      fill_in"idea[title]", with: "FLYING CARS"
      select("Idiotic Ideas", from: "idea_category_id").select_option

      click_on("Create Idea")

      expect(current_path).to eq(user_idea_path(user, Idea.last.id))

      expect(page).to have_content("FLYING CARS")

      expect(page).to have_content("Idiotic Ideas")
    end
  end
end
