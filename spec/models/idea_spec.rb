require 'rails_helper'

RSpec.describe Idea, type: :model do
  context "validations" do
    it "cannot save without a title" do
      idea = Idea.new()

      expect(idea).to_not be_valid
    end

    it "can save with a title" do
      idea = Idea.new(title: "iPhone")

      expect(idea).to be_valid
    end
  end
end
