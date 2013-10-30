require "test_helper"

feature "A user can sign in" do
  scenario "Sign in works" do
    sign_in
    page.text.must_include "Testy Tester"
  end

  scenario "A user gets redirected to their profile page after signing in" do
  	sign_in
  	page.must_have_link("New Container")
  end

  scenario "A user gives invalid data" do
    visit root_path
    click_on "Sign in"
    page.text.must_include "Sign in"

  end

  scenario "user visits home page while signed in" do
    sign_in
    visit root_path
    page.must_have_content "New Container"
  end
end
