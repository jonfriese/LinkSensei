require "test_helper"

feature "A user can change the user account privacy settings" do

  scenario "User settings default to private" do
    sign_in
    page.text.must_include "private account"
    click_on "Sign Out"
  end

  scenario "User checks box on edit profile page" do
    sign_in
    click_on "#{users(:user).name}"
    check "Public status"
    fill_in "Current password", with: "password"
    click_on "Update User"
    page.text.must_include "public account"
    click_on "Sign Out"
  end

  scenario "User with public status can change back to private" do
    sign_in_as_public_user
    click_on "#{users(:public_user).name}"
    uncheck "Public status"
    fill_in "Current password", with: "password"
    click_on "Update User"
    page.text.must_include "private account"
    click_on "Sign Out"
  end

  scenario "Users with private status do not appear on users index view" do
    sign_in
    page.text.must_include "Browse Users"
    click_on "Browse Users"
    page.text.must_include "#{users(:public_user).name}"
    page.text.wont_include "#{users(:user).name}"
    click_on "Home"
    click_on "Sign Out"
  end

end

