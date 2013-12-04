require "test_helper"

feature "As a site user, I want to clone a container from another user, so that I can add interesting containers to my page" do

  #happy paths
  scenario "User clones a container and user page is updated with container and link to original creator name" do
    sign_in

    create_container

    click_on "Test Guy"
    check "Public status"
    fill_in "Current password", with: "test1234"
    click_on "Update User"
    page.text.must_include "public account"
    click_on "Sign Out"

    sign_in

    click_on "Browse Users"
    click_on "Test Guy"

    # save_and_open_page
    within "#container_3" do
      click_on "clone_container"
    end

    click_on "Home"

    #Check if user page has container and original author name
    page.has_content? "A container"
    page.text.must_include "Created By: Test Guy"

    click_on "Browse Users"
    click_on "Test Guy"

    #Check if page from whence the container was cloned has a clone count
    page.text.must_include "Clone Count: 1"
    page.text.wont_include "Created By: Test Guy"
  end
end
