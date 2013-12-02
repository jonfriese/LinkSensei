require "test_helper"

feature "A user can change a container starred settings" do

  scenario "Container settings default to unstarred" do
    skip
    # visit root_path
    # within("//div[@id='signup']") do
    #   fill_in "Full Name", with: "Test Guy"
    #   fill_in "Enter email", with: "tester@example.com"
    #   fill_in "Password", with: "test1234"
    #   fill_in "Confirm password", with: "test1234"
    # end

    # click_on "Sign up"
    # page.text.must_include "Test Guy"
    # save_and_open_page
    # page.text.wont_include "★"
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

