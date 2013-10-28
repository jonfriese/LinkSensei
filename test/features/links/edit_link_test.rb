# require "test_helper"

# feature "As a site user, I want to to edit an existing link so that I can give it a more accurate description" do

#   scenario "User edits a link" do
#     #Given a signed-in user
#     sign_in

#     #And given an existing container
#     page.has_content containers(:container_one).title

#     #Then the user clicks on a the container name
#     click_on containers(:container_one).title

#     #and selects an existing link
#     page.has_content links(link_three).title
#     click_on "Edit Link"

#     #and selects an existing container from the dropdown list
#     fill_in "Description", with: "Yet another cat site."
#     click_on "Submit Changes"

#     #Then the resulting page should show the moved link in the new container
#     page.text.must_include "success"
#     page.text.must_include "Yet another cat site."
#   end
# end
