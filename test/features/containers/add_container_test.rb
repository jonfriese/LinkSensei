require "test_helper"

feature "As a site user, I want to add a container, so that I can store links" do

  #happy paths
  scenario "User creates a new container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the create container button in the main window
    create_container
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
