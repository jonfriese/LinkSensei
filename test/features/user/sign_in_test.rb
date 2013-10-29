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

end
