require "test_helper"

feature "As a site user, I want to be able to edit a container, to make updates and corrections" do
  scenario "User edits a container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    create_container

    # And wants to make an edit
    click_on "edit_container_2"
    fill_in "Name", with: "A container--edited"
    click_on "Update Container"

    # The container should update with a success message and display the new info
    page.has_content? "A container--edited"
    page.has_css? ".alert alert-success"
    page.has_content? "Container was successfully updated."
  end

  scenario "User edits a container incorrectly" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    create_container

    # And wants to make an edit
    click_on "edit_container_2"
    fill_in "Name", with: ""
    click_on "Update Container"

    # The container should update with a success message and display the new info
    page.has_css? ".alert alert-warning"
    page.has_content? "Name is too short (minimum is 4 characters)"
  end


end
