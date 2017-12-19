require 'rails_helper'

describe "As a user" do
  describe "I can click the delete button on the idea index" do
    before :each do
      @user = User.create(user_name: "TYJOO", password: "123")
      @category = Category.create(name: "Stupid Ideas")
      @idea = @user.ideas.create(title: "FLYING SHARKS", category: @category)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit user_ideas_path(@user)
    end

    it "will destroy that individual idea resource and redirect me to index without that resource that is deleted" do

      expect(page).to have_content("FLYING SHARKS")
      within(".delete-button") do
        click_on("Delete")
      end

      expect(current_path).to eq(user_ideas_path(@user))

      expect(page).to_not have_content("FLYING SHARKS")
    end
  end
end
