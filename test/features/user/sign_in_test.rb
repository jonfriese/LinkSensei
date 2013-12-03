require "test_helper"

feature "A user can sign in" do
  scenario "A user gets redirected to their profile page after signing in" do
  	sign_in
  	page.must_have_content users(:user).name
    page.must_have_content "Browse Users"
    page.has_css? ".alert alert-success"
    page.has_content? "Signed in successfully."
  end

  scenario "A user gives invalid data" do
    visit root_path
    click_on "Sign in"
    page.text.must_include "Sign in"

  end

  scenario "user visits home page while signed in" do
    sign_in
    visit root_path
    page.must_have_content users(:user).name
  end

  scenario "user homepage paginates" do
    create_eleven_containers
    page.must_have_content "Previous"
    page.must_have_content "Next"
  end
end
