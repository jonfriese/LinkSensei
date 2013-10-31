require "test_helper"

feature "As a site user, I want to to move a link from the staging area into a container so that I can find it again more easily" do
  scenario "User moves a new link from the staging area to an existing container" do
    #Given a signed-in user
    # sign_in
    # visit new_user_container_path(@user.id)
    # save_and_open_page
    skip
 end

  scenario "User moves a new link from the an existing container to another existing container to correct a misplaced link" do
    #Given a signed-in user
    sign_in

    #And given an existing container
    create_container
    create_link

    # and a second container
    click_on "New Container"
    # #Then a modal window form should appear, and is filled in
    fill_in "Name", with: "second container"
    fill_in "Description", with: "second description"
    click_on "Create Container"

    within("//div[@id='container_1']") do
      page.find("#editlink").click
    end
    select('second container', :from => 'link[container_id]')
    click_on "Update Link"
    within("//div[@id='container_2']") do
      page.has_content? "a search engine"
    end

    #Then the user clicks on a the container name


    #and selects an existing link

    #and selects an existing container from the dropdown list

    #Then the resulting page should show the moved link in the new container

  end
end
