require "test_helper"

feature "As a site user, I want to view my homepage so that I can use my saved
links and containers" do

scenario "user signs in and sees a personalized homepage" do
  sign_in
  page.text.must_include "Signed in successfully."
  page.text.must_include users(:user).name
  page.text.must_include "Cat"
  page.text.must_include "Dog"
  end
end
