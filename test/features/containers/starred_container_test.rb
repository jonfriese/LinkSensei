require "test_helper"

feature "A user can change a container starred settings" do

  scenario "User checks box on edit container page" do
    visit root_path
    within("//div[@id='signup']") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"
    page.text.must_include "Test Guy"

    page.text.wont_include "★"
    click_on "edit_container_2"
    check "Starred"
    click_on "Update Container"
    page.text.must_include "★"
  end

  scenario "Containers with stars are listed first" do
    skip
  end
end

