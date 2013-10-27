require "test_helper"

feature "As a site user, I want to to delete a link I had previously saved, so that I can eliminate clutter" do
  scenario "User deletes a link from the staging area" do
    #Given a signed-in user
    sign_in

    #And given an existing link in the staging area
    page.has_content links(link_two).title

    #Then the user clicks on a delete icon near the link name
    find(links(link_two)).click_on "Delete Link"

    #and clicks on the delete button
    click_on "Delete Link"

    #Then the resulting page should not include the link
    page.wont_have_content links(:link_two).title
  end

  scenario "User deletes a link from a container" do
    #Given a signed-in user
    sign_in

    #And given an existing container
    page.has_content containers(:container_one).title

    #Then the user clicks on a the container name to go to the edit container view
    click_on containers(:container_one).title

    #Then the user clicks on a delete icon near the link name
    find(links(link_three)).click_on "Delete Link"

    #Then the resulting page should not include the link
    page.wont_have_content containers(:container_one).title
  end
end
