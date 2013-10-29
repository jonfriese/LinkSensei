require "test_helper"

feature "As a site user, I want to add a container, so that I can store links" do

  #happy paths
  scenario "User creates a new container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the create container button in the main window
    create_container
  end

  scenario "User edits a container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    create_container

    # And wants to make an edit
    click_on "Edit"
    fill_in "Name", with: "A container--edited"
    click_on "Update Container"
    # The container should update with a success message and display the new info
    page.has_content? "Container was successfully updated."
    page.has_content? "A container--edited"
  end

  scenario "User creates a new container, and pre-populates with links" do
    skip
#     #Given a signed-in user
#     sign_in

#     #When the user clicks the add container button in the main window
#     click_on "Add Container"

#     #Then a modal window form should appear, and is filled in
#     fill_in "Title", with: containers(:container_one).title
#     check links(:link_two).title
#     click_on "Create Container"

#     #Then the resulting page should show the new container in the main window
#     page.should have_content(containers(:container_one).title)
#     find(containers(:container_one).title).should have_content(links(:link_two).title)
  end

  #unhappy paths
  scenario "User creates a new container, and forgets the title" do
     #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    click_on "New Container"

    # Then a form should appear, and is filled in incorrectly
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_on "Create Container"
    # And an error message is displayed
    page.has_content? "prohibited"
    page.has_content? "Name can't be blank"
  end

  scenario "User creates a container, and gives it a title that already exists" do

    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    create_container

    # Then the user calls up a second form and fills it in with the same information
    click_on "New Container"
    fill_in "Name", with: "A container"
    fill_in "Description", with: "A description"
    click_on "Create Container"

    # Then there should be an error message for uniqueness validation
    page.has_content? "prohibited"
    page.has_content? "Name has already been taken"
  end
end
