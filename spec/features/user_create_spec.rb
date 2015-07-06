require 'rails_helper'

feature "signup" do
  scenario "Creating a new user" do
    # User.create(name: "mcgrath", email: "mandm@example.com", password: "password")

    visit root_path
    click_link('SignUp')
    expect(page).to have_content("This is a NEW user form")
    fill_in('Name', with: "Tommy")
    fill_in('Email', with: "tom@example.com")
    fill_in('Password', with: "password")
    click_button('Create')
    expect(page).to have_content("This is a profile page of Tommy")
  end
end
