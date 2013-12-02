require "test_helper"

feature "A user can change a container starred settings" do

  scenario "Container settings default to unstarred" do
    sign_in
    save_and_open_page
    # page.text.wont_include "&#9733;"
  end

  # scenario "User checks box on edit container page" do
    # sign_in
    # click_on "#{users(:user).name}"
    # check "Public status"
    # fill_in "Current password", with: "password"
    # click_on "Update User"
    # page.text.must_include "public account"
    # click_on "Sign Out"
  # end

  # scenario "Containers with stars are listed first" do
    # sign_in_as_public_user
    # click_on "#{users(:public_user).name}"
    # uncheck "Public status"
    # fill_in "Current password", with: "password"
    # click_on "Update User"
    # page.text.must_include "private account"
    # click_on "Sign Out"
  # end
end

