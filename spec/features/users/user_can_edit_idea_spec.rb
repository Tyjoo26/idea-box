require 'rails_helper'

describe "As a user" do
  describe "when I visit the idea index, I can click the option to edit an idea" do
    before :each do
      @idea = Idea.create(title: "FLYING PIGS")

      visit edit_idea_path(@idea)
    end


    it "will display an edit page with a form field and an edit button" do

      fill_in"idea[title]", with: "FLYING SHARKS"

      click_button("Edit Idea")

      expect(current_path).to eq(idea_path(@idea))

      expect(page).to have_content("FLYING SHARKS")
    end
  end
end
