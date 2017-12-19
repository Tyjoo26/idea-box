require 'rails_helper'

describe "As a user" do
  describe "when I visit the idea index, I can click the option to edit an idea" do
    before :each do
      @user = User.create(user_name:"TYJOO", password: "123")
      @category = create(:category)
      @idea = @user.ideas.create(title: "FLYING PIGS", category: @category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit edit_user_idea_path(@user, @idea)
    end


    it "will display an edit page with a form field and an edit button" do

      fill_in"idea[title]", with: "FLYING SHARKS"
      select("Idiotic Ideas", from: "idea_category_id").select_option

      click_button("Edit Idea")

      expect(current_path).to eq(user_idea_path(@user, @idea))

      expect(page).to have_content("FLYING SHARKS")
      expect(page).to have_content("Idiotic Ideas")
    end
  end
end
