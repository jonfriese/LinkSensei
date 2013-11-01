require "test_helper"

feature "As a site user, I want to to delete a link I had previously saved, so that I can eliminate clutter" do
  scenario "User deletes a link from the staging area" do
    sign_in

    create_container

    #When the user clicks the add link button in the staging area

    within("//div[@id='custom-well-left']") do
      find("#stagingnew").click
    end
    # Then a form should appear, and is filled in
    within("//div[@id='modal_container_1']") do
      fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"
    end
    within("//div[@id='custom-well-left']") do
      find("#staging_trash_link").click
    end
    page.wont_have_content "www.test.com"
  end

  scenario "User deletes a link from a container" do
    #Given a signed-in user
    sign_in

    #And given an existing link
    create_container
    create_link

    #Then the user clicks on a delete icon near the link name
    page.find("#destroylink").click

    #Then the resulting page should not include the link
    page.wont_have_content "Google"
  end
end


