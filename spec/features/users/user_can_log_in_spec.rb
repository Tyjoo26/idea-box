require 'rails_helper'

describe "As a visitor, when i visit the home page" do
  it "displays a link to login and takes me to a form page" do
    user = User.create(username: "TYJ", password: "test")
    visit '/'

    expect(current_path).to eq(root_path)
    click_link("Log In")
    expect(current_path).to eq(login_path)

    fill_in "username", with: "TYJ"
    fill_in "password", with: "test"
    click_link("Log In")

    expect(current_path).to eq(user_path(user))
    expect(page).to have_content("Welcome Back #{user.username}!")
  end
end
