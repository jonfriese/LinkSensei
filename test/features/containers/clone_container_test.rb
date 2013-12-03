require "test_helper"

feature "As a site user, I want to clone a container from another user, so that I can add interesting containers to my page" do

  #happy paths
  scenario "User clones a container" do
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
      click_on "CLONE"
    end

    click_on "Home"

    #check if on correct user page and that cloned container is present
    page.text.must_include "Testy Tester"
    page.has_content? "A container"

  end
end
