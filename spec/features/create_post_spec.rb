require 'rails_helper'

feature "create new post" do
  scenario "User specific post is created" do
    def user_login
      example_user = User.create(name: "mcgrath", email: "mandm@example.com", password: "password")
      visit root_path
      click_link "Login"
      fill_in('Name', with: example_user.name)
      fill_in('Password', with: example_user.password)
      click_button "Login"
    end
    user_login
    click_link "Create a Post"
    fill_in("Url", with: "http://www.google.com")
    fill_in("Body", with: "A search engine")
    click_button "Create Post"
    expect(page).to have_link("A search engine")
    puts html
  end
end
