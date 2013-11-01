require "test_helper"

feature "As a site user, I want to to move a link from the staging area into a container so that I can find it again more easily" do
  scenario "User moves a new link from the staging area to an existing container" do
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
    within("//div[@id='custom-well-left']") do
      find("#staging_edit_link").click
    end
    select('A container', :from => 'link[container_id]')
    click_on "Update Link"

    within("//div[@id='container_2']") do
      find("#show").click
    end
    page.has_content? "Test"
    click_on "Home"
    click_on "Sign Out"
 end
end
