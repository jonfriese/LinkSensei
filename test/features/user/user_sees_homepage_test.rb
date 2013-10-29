require "test_helper"

feature "As a site user, I want to view my homepage so that I can use my saved
links and containers" do

scenario "user signs in and sees a personalized homepage" do
#   sign_in
#   save_and_open_page
#   # page.text.must_include "Signed in successfully."
#   # page.text.must_include users(:user).name
#   # page.text.must_include "Cat"
#   # page.text.must_include "Dog"
#   end
sign_in
click_on "Containers list"
page.text.must_include "Listing containers"
page.text.must_include containers(:container_one.name)
end
end
