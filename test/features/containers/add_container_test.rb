require "test_helper"

feature "As a site user, I want to add a container, so that I can store links" do

  #happy paths
  scenario "User creates a new container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the create container button in the main window
    create_container
    page.has_css? ".alert alert-success"
    page.has_content? "Container was successfully created."
  end


  #unhappy paths
  scenario "User creates a new container, and forgets the title" do

    visit root_path

    within "#signup" do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"
    #When the user clicks the add container button in the main window
    page.find("#new_container_plus").click

    # Then a form should appear, and is filled in incorrectly
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_on "Create Container"
    # And an error message is displayed
    page.has_css? ".alert alert-warning"
    page.has_content? "prohibited"
    page.has_content? "Name can't be blank"
  end
end
