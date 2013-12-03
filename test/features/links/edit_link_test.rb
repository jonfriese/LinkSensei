require "test_helper"

feature "As a site user, I want to to edit an existing link so that I can give it a more accurate description" do

  scenario "User edits a link" do
    #Given a signed-in user
    sign_in

    #And given an existing link
    create_container
    create_link

    #Then the user clicks on a edit icon near the link name
    page.find("#editlink").click

    #User makes changes
    fill_in "Name", with: "GOOGLE"
    click_on "Update Link"
    # The container should update with a success message and display the new info
    page.has_content? "Link was successfully updated."
    page.has_content? "GOOGLE"
    page.wont_have_content "Google"
    page.has_css? ".alert alert-success"
    page.has_content? "Link was successfully updated."
  end

  scenario "User edits a link incorrectly" do
    #Given a signed-in user
    sign_in

    #And given an existing link
    create_container
    create_link

    #Then the user clicks on a edit icon near the link name
    page.find("#editlink").click

    #User makes changes
    fill_in "Url", with: ""
    click_on "Update Link"

    # The container should update with a success message and display the new info
    page.has_css? ".alert alert-warning"
    page.has_content? "Url can't be blank"
  end
end
