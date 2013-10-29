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

  scenario "User creates a new link in the staging area, and pre-sorts" do
    skip
    # #Given a signed-in user
    # sign_in

    # #When the user clicks the add link button in the staging area
    # click_on "Add Link"

    # #Then a modal window form should appear, and is filled in, including a container chosen from a select element drop down menu

    # fill_in "Address", with: links(:link_one).address
    # fill_in "Title", with: links(:link_one).title
    # fill_in "Description", with: links(:link_one).description
    # select(containers(:container_one).title, :from => 'Containers')
    # click_on "Create Link"

    # #Then the resulting page should show the new link in the chosen container
    # find(containers(:container_one).title).should have_content(links(:link_one).title)
  end

  #unhappy paths
  scenario "User creates a new link in an existing container, incorrectly" do

    # Given a signed-in user
    sign_in
    create_container
    #When the user clicks the add link button in a container view
    click_on "Show"
    click_on "Add Link"

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
