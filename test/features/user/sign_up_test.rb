require "test_helper"

feature "A user can sign in" do
  scenario "user sign up" do
    visit root_path
    within("//div[@id='signup']") do
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end
    click_on "Sign up"
    page.text.must_include "tester@example.com"
  end

  scenario "user tries to sign up with invalid data" do
    click on "Sign up"

  end

end
