require "test_helper"

feature "As a site user, I want to to add a link to my collection so that I use it in the future" do

  #happy paths
  scenario "User creates a new link in an existing container" do
    #Given a signed-in user
    sign_in
    create_container
    #When the user clicks the add link button in the staging area



    #Then a modal window form should appear, and is filled in
    create_link

    # save_and_open_page
  end

  scenario "User creates a new link in the staging area" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add link button in the staging area

    within("//div[@id='custom-well-left']") do
      find("#stagingnew").click
    end
    save_and_open_page
    #Then a form should appear, and is filled in
    # fill_in "Address", with: "something"
    # fill_in "Title", with: "something"
    # fill_in "Description", with: "something"
    # click_on "Create Link"

    # #Then the resulting page should show the new link in the chosen container
    # page.find("Staging").should have_content "something"
  end

  #unhappy paths
  scenario "User creates a new link in an existing container, incorrectly" do

    # Given a signed-in user
    sign_in
    create_container
    #When the user clicks the add link button in a container view
    page.find("#show").click
    page.find('#add_link').click

    #Then a modal window form should appear, and is filled in incorrectly

    fill_in "Url", with: ""
    fill_in "Name", with: ""
    fill_in "Description", with: ""
    click_on "Create Link"

    # save_and_open_page
    # #Then the resulting page should show the new link in the staging area
    page.has_content? "prohibited"
    page.has_content? "Url can't be blank"
  end
end
