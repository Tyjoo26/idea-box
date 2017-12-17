require 'rails_helper'

describe "As a user" do
  describe "when I visit the idea index, I can click the option to edit an idea" do
    before :each do
      @category = create(:category)
      @idea = @category.ideas.create(title: "FLYING PIGS")

      visit edit_category_idea_path(@idea.category, @idea)
    end


    it "will display an edit page with a form field and an edit button" do

      fill_in"idea[title]", with: "FLYING SHARKS"
      select("Idiotic Ideas", from: "idea_category_id").select_option

      click_button("Edit Idea")

      expect(current_path).to eq(category_idea_path(@idea.category, @idea))

      expect(page).to have_content("FLYING SHARKS")
      expect(page).to have_content("Idiotic Ideas")
    end
  end
end
