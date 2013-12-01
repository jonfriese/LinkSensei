require "test_helper"

feature "As a site user, I want to to add a link to my collection so that I use it in the future" do

  #happy paths
  scenario "User creates a new link in an existing container" do
    sign_in
    create_container
    # page.find("#add_link").click
       within("//div[@id='modal_link_container_1']") do
      fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"
    end


    #Then the resulting page should show the new link in the chosen container
    page.has_content? "test.com"
  end

  scenario "User creates a new link in the staging area" do
    #Given a signed-in user
    sign_in

    create_container

    #When the user clicks the add link button in the staging area

    within("//div[@id='custom-well-left']") do
      find("#stagingnew").click
    end
    # Then a form should appear, and is filled in
    within("//div[@id='modal_link_container_1']") do
      fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"
    end


    #Then the resulting page should show the new link in the chosen container
    page.has_content? "test.com"
  end

  #unhappy paths
  scenario "User creates a new link in an existing container, incorrectly" do

    # Given a signed-in user
    sign_in
    create_container
    #When the user clicks the add link button in a container view
    # page.find("#show").click
    # page.find('#add_link').click

    #Then a modal window form should appear, and is filled in incorrectly
    within("//div[@id='modal_link_container_1']") do
    fill_in "Url", with: ""
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_on "Create Link"
    end

    # save_and_open_page
    # #Then the resulting page should show the new link in the staging area
    page.has_content? "prohibited"
    page.has_content? "Url can't be blank"
  end

  scenario "User creates a link with an invalid TLD" do
        # Given a signed-in user
    sign_in
    create_container
    within("//div[@id='modal_link_container_1']") do
    fill_in "Url", with: "www.google.con"
    fill_in "Name", with: "google"
    fill_in "Description", with: "search"
    click_on "Create Link"
    end
    page.text.must_include "Url URL must have a public suffix"
  end
end
