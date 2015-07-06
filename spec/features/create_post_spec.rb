require 'rails_helper'

feature "create new post" do
  scenario "User specific post is created" do
    user_login
    click_link "Create a Post"
    fill_in("Url", with: "http://www.google.com")
    fill_in("Body", with: "A search engine")
    click_button "Create Post"
    expect(page).to have_link("A search engine")
  end
end
