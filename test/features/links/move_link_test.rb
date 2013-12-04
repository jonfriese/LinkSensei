require "test_helper"
require "pry"

feature "As a site user, I want to to move a link from the staging area into a container so that I can find it again more easily" do
  scenario "User moves a new link from the staging area to an existing container" do
  sign_in

    create_container
    create_staging_link

    within "#custom-well-left" do
      find("#link_edit").click
    end
    select('A container', :from => 'link[container_id]')
    click_on "Update Link"

    within("#container_2") do
      find("#show").click
    end
    page.has_content? "Test"
    click_on "Back"
    click_on "Sign Out"
 end
end
