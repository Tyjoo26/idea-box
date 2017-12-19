require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validations' do
    it "cant save without a name" do
      category = Category.new

      expect(category).to_not be_valid
    end

    it 'can save with a name' do
      category = Category.new(name: "Shit")

      expect(category).to be_valid
    end
  end
end
