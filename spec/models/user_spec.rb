require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it 'cant save a user without username' do
      user = User.new(password: "123")
      expect(user).to_not be_valid
    end

    it 'cant save a user without password' do
      user = User.new(user_name:"TYJ")
      expect(user).to_not be_valid
    end

    it "can save with username and password " do
      user = User.new(user_name: "TYJ", password: "123")
      expect(user).to be_valid
    end
  end
end
