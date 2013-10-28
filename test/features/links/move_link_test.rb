# require "test_helper"

# feature "As a site user, I want to to move a link from the staging area into a container so that I can find it again more easily" do
#   scenario "User moves a new link from the staging area to an existing container" do
#     #Given a signed-in user
#     sign_in

#     #And given an existing link in the staging area
#     page.has_content links(link_two).title
#     click_on "Edit Link"

#     #and selects an existing container from the dropdown list
#     select(containers(:container_one).title, :from => 'Containers')
#     click_on "Submit Changes"

#     #Then the resulting page should show the moved link in the new container
#     page.text.must_include "success"
#     find(containers(:container_one).title).should have_content(links(:link_two).title)
#   end

#   scenario "User moves a new link from the an existing container to another existing container to correct a misplaced link" do
#     #Given a signed-in user
#     sign_in

#     #And given an existing container
#     page.has_content containers(:container_one).title

#     #Then the user clicks on a the container name
#     click_on containers(:container_one).title

#     #and selects an existing link
#     page.has_content links(link_four).title
#     click_on "Edit Link"

#     #and selects an existing container from the dropdown list
#     select(containers(:container_two).title, :from => 'Containers')
#     click_on "Submit Changes"

#     #Then the resulting page should show the moved link in the new container
#     page.text.must_include "success"
#     find(containers(:container_one).title).should have_content(links(:link_two).title)
#   end
# end
