# require "test_helper"

# feature "As a site user, I want to to add a link to my collection so that I use it in the future" do

#   #happy paths
#   scenario "User creates a new link in the staging area" do
#     #Given a signed-in user
#     sign_in

#     #When the user clicks the add link button in the staging area
#     click_on "Add Link"

#     #Then a modal window form should appear, and is filled in
#     fill_in "Address", with: links(:link_one).address
#     fill_in "Title", with: links(:link_one).title
#     fill_in "Description", with: links(:link_one).description

#     #But the link container drop down menu is left blank
#     click_on "Create Link"

#     #Then the resulting page should show the new link in the staging area
#     find('#staging').should have_content(links(:link_one).title)
#   end

#     scenario "User creates a new link in the staging area, and pre-sorts" do
#     #Given a signed-in user
#     sign_in

#     #When the user clicks the add link button in the staging area
#     click_on "Add Link"

#     #Then a modal window form should appear, and is filled in, including a container chosen from a select element drop down menu

#     fill_in "Address", with: links(:link_one).address
#     fill_in "Title", with: links(:link_one).title
#     fill_in "Description", with: links(:link_one).description
#     select(containers(:container_one).title, :from => 'Containers')
#     click_on "Create Link"

#     #Then the resulting page should show the new link in the chosen container
#     find(containers(:container_one).title).should have_content(links(:link_one).title)
#   end

#   #unhappy paths
#   scenario "User creates a new link in the staging area, and forgets the address" do
#     #Given a signed-in user
#     sign_in

#     #When the user clicks the add link button in the staging area
#     click_on "Add Link"

#     #Then a modal window form should appear, and is filled in incorrectly

#     # fill_in "Address", with: links(:one).address
#     fill_in "Title", with: links(:link_one).title
#     fill_in "Description", with: links(:link_one).description
#     click_on "Create Link"

#     #Then the resulting page should show the new link in the staging area
#     page.text.must_include "prohibited this project from being saved"
#     page.text.must_include "Please enter some text in the 'address' field."
#   end

#   scenario "User creates a new link in the staging area, and gives it a title that already exists" do
#     #Given a signed-in user
#     sign_in

#     #When the user clicks the add link button in the staging area
#     click_on "Add Link"

#     #Then a modal window form should appear, and is filled in incorrectly

#     # fill_in "Address", with: links(:one).address
#     fill_in "Title", with: "Funny Cat Pix"
#     fill_in "Description", with: "my favorite site"
#     click_on "Create Link"

#     #Then the resulting page should show the flash error
#     page.text.must_include "prohibited this project from being saved"
#     page.text.must_include "Please enter a unique title"
#   end
# end
