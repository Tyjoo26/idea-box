require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    before :each do
      @category = Category.create(name: "Idiotic Ideas")
    end
    it "cannot save without a title" do
      idea = Idea.new(category: @category)

      expect(idea).to_not be_valid
    end

    it "cannot save a duplicate idea if the idea already exists" do
      idea_1 = Idea.create(title: "FLYING PIGS", category: @category)
      idea_2 = Idea.new(title: "FLYING PIGS", category: @category)

      expect(idea_2).to_not be_valid
    end

    it "cannot save a idea without category" do
      idea_1 = Idea.create(title: "FLYING PIGS")

      expect(idea_1).to_not be_valid
    end

    it "can save with a title and category" do
      idea = Idea.new(title: "iPhone", category: @category)

      expect(idea).to be_valid
    end
  end
end
