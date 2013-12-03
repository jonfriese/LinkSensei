require "test_helper"

feature "As a site user, I want to to add a link to my collection so that I use it in the future" do

  #happy paths
  scenario "User creates a new link in an existing container" do
    sign_in
    create_container

    within "#container_3" do
      click_on "add_link"
    end

    fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"
    #Then the resulting page should show the new link in the chosen container

    within "#container_3" do
      has_content? "test.com"
    end
  end

  scenario "User creates a new link in the staging area" do
    #Given a signed-in user
    sign_in
    create_container

    #When the user clicks the add link button in the staging area

    within "#custom-well-left" do
      find("#stagingnew").click
    end
    fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"

    # #Then the resulting page should show the new link in the chosen container
    within "#custom-well-left" do
      has_content? "test.com"
    end
  end

  #unhappy paths
  scenario "User creates a new link in an existing container, incorrectly" do

    # Given a signed-in user
    sign_in
    create_container

    #When the user clicks the add link button
    within "#custom-well-left" do
      find("#stagingnew").click
    end
    fill_in "Url", with: ""
    fill_in "Name", with: ""
    click_on "Create Link"

    #Then the resulting page should show the new link in the staging area
    page.has_content? "prohibited"
    page.has_content? "Url can't be blank"
  end

  scenario "User creates a link with an invalid TLD" do
    # Given a signed-in user
    sign_in
    create_container
    within "#custom-well-left" do
      find("#stagingnew").click
    end
    fill_in "Url", with: "www.google.con" #typo
    fill_in "Name", with: "google"
    fill_in "Description", with: "search"
    click_on "Create Link"
    page.text.must_include "Url must have a public suffix"
  end
end
