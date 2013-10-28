# require "test_helper"

# feature "As a site user, I want to to delete a container I had previously saved, so that I can eliminate clutter" do
#   scenario "User deletes a container" do
#     #Given a signed-in user
#     sign_in

#     #And given an existing container
#     page.has_content containers(:container_one).title

#     #Then the user clicks on a the container name
#     click_on containers(:container_one).title

#     #and clicks on the delete button
#     click_on "Delete Container"

#     #Then the resulting page should not include the link
#     page.wont_have_content containers(:container_one).title
#   end
# end
