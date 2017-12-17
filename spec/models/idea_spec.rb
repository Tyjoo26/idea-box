require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    it "cannot save without a title" do
      idea = Idea.new()

      expect(idea).to_not be_valid
    end

    it "cannot save a duplicate idea if the idea already exists" do
      idea_1 = Idea.create(title: "FLYING PIGS")
      idea_2 = Idea.new(title: "FLYING PIGS")

      expect(idea_2).to_not be_valid
    end

    it "can save with a title" do
      idea = Idea.new(title: "iPhone")

      expect(idea).to be_valid
    end
  end
end
