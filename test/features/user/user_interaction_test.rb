require "test_helper"

feature "A user can view other public users" do

  scenario "Users with public status appear on users index view" do
    sign_in
    click_on "Browse Users"
    page.text.must_include "#{users(:public_user).name}"
    click_on "Home"
    click_on "Sign Out"
  end

  scenario "Users can visit pages of other public users, but will not see other users' staging areas" do
    sign_in
    click_on "Browse Users"
    page.text.must_include "#{users(:public_user).name}"
    click_on "#{users(:public_user).name}"
    page.has_no_css? "custom-well-left"
    page.text.must_include "viewing user #{users(:public_user).name}"
    click_on "Home"
    page.text.wont_include "viewing user"
    page.has_css? "custom-well-left"
    click_on "Sign Out"
  end
end

