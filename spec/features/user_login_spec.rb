require 'rails_helper'

feature "login" do
  scenario "Signing in a new user" do
    example_user = User.create(name: "mcgrath", email: "mandm@example.com", password: "password")
    visit root_path
    click_link "Login"
    expect(page).to have_content("This is the login page")
    fill_in('Name', with: example_user.name)
    fill_in('Password', with: example_user.password)
    click_button "Login"
    expect(page).to have_title("HackerNewsOnRails")
  end
end
