require 'rails_helper'

describe "As a user" do
  describe "I can click the delete button on the idea index" do
    before :each do
      @idea = Idea.create(title: "FLYING SHARKS")

      visit ideas_path
    end

    it "will destroy that individual idea resource and redirect me to index without that resource that is deleted" do
      expect(page).to have_content("FLYING SHARKS")

      within(".delete-button") do
        click_on("Delete")
      end

      expect(current_path).to eq(ideas_path)

      expect(page).to_not have_content("FLYING SHARKS")
    end
  end
end
