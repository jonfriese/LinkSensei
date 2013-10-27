require "test_helper"

feature "As a site user, I want to to add a container to my collection so that I can store links" do

  #happy paths
  scenario "User creates a new container" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    click_on "Add Container"

    #Then a modal window form should appear, and is filled in
    fill_in "Title", with: containers(:container_one).title

    #But the unsorted links checkboxes are left blank
    click_on "Create Container"

    #Then the resulting page should show the new container in the main window
    page.should have_content(containers(:container_one).title)
  end

  scenario "User creates a new container, and pre-populates with links" do
    #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    click_on "Add Container"

    #Then a modal window form should appear, and is filled in
    fill_in "Title", with: containers(:container_one).title
    check links(:link_two).title
    click_on "Create Container"

    #Then the resulting page should show the new container in the main window
    page.should have_content(containers(:container_one).title)
    find(containers(:container_one).title).should have_content(links(:link_two).title)
  end

  #unhappy paths
  scenario "User creates a new container, and forgets the title" do
     #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    click_on "Add Container"

    #Then a modal window form should appear, and is filled in
    click_on "Create Container"

    #Then the resulting page should show the flash error
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "Please enter some text in the 'title' field."
  end

  scenario "User creates a container, and gives it a title that already exists" do
     #Given a signed-in user
    sign_in

    #When the user clicks the add container button in the main window
    click_on "Add Container"

    #Then a modal window form should appear, and is filled in
    fill_in "Title", with: "Cats"
    click_on "Create Container"

    #Then the resulting page should show the flash error
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "Please enter a unique title"
  end
end
