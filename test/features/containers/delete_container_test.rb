require "test_helper"

feature "As a site user, I want to to delete a container I had previously saved, so that I can eliminate clutter" do
  scenario "User deletes a container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    create_container

    # The user is redirected to the container index, which lists the container, and clicks on the delete button
    page.find("#destroy").click

    #Then the resulting page should not include the link
    page.wont_have_content "A container"
    page.wont_have_content "A description"
  end
end
