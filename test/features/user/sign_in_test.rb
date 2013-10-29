require "test_helper"

feature "A user can sign in" do
  scenario "Sign in works" do
    sign_in
    page.text.must_include "Signed in successfully."
  end

  scenario "A user gets redirected to their profile page after signing in" do
  	sign_in
  	page.must_have_link("New Container")
  end

  scenario "A user gives invalid data" do
    click "Sign in"

  scenario "User tries to sign in with invalid data" do
    click "Sign in"
    page.text.must_include "You need to sign in or sign up"
  end
end
