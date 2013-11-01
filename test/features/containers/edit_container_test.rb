require "test_helper"

feature "As a site user, I want to be able to edit a container, to make updates and corrections" do
  scenario "User edits a container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    create_container

    # And wants to make an edit
    page.find("#edit").click

    within("//div[@id='modal_edit_container_2']") do
        fill_in "Name", with: "A container--edited"
        click_on "Update Container"
    end
    # The container should update with a success message and display the new info
    page.has_content? "A container--edited"
  end
end
