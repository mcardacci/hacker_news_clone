require 'rails_helper'

feature "create new comment" do
  scenario "a user can create a new comment" do
    create_post
    expect(page).to have_link("Comments")
    click_link("Comments")
    expect(page).to have_link("Create a Comment")
    click_link("Create a Comment")
    fill_in('comment_body', with: "This is a comment")
    click_button('Create Post')
    expect(page).to have_content("This is a comment")
  end
end
