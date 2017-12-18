require 'rails_helper'

describe "As a user" do
  describe "I can click the delete button on the idea index" do
    before :each do
      @category = Category.create(name: "Stupid Ideas")
      @idea = @category.ideas.create(title: "FLYING SHARKS")

      visit category_ideas_path(@category)
    end

    it "will destroy that individual idea resource and redirect me to index without that resource that is deleted" do

      expect(page).to have_content("FLYING SHARKS")
      within(".delete-button") do
        click_on("Delete")
      end

      expect(current_path).to eq(category_ideas_path(@category))

      expect(page).to_not have_content("FLYING SHARKS")
    end
  end
end
