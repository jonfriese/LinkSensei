require "test_helper"

feature "A user can view other public users" do

  scenario "Users with public status appear on users index view" do
    sign_in
    click_on "Browse Users"
    page.text.must_include "#{users(:public_user).name}"
    sign_out
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

  scenario "Public users can be searched" do
    sign_in
    click_on "Browse Users"
    page.text.must_include "#{users(:public_user).name}"
    page.text.must_include "#{users(:public_user2).name}"
    fill_in('search', :with => "#{users(:public_user2).name}")
    click_on "Search users"
    page.text.wont_include "#{users(:public_user).name}"
    page.text.must_include "#{users(:public_user2).name}"
    page.text.wont_include "#{users(:user).name}"
    sign_out
  end

  scenario "user navigation bar dynamically shows user names" do
    sign_in
    page.text.must_include "#{users(:user).name}"
    page.has_no_css? ".alert alert-warning"
    page.text.must_include "Browse Users"
    page.text.wont_include "viewing user"
    click_on "Browse Users"
    click_on "#{users(:public_user).name}"
    page.text.must_include "viewing user #{users(:public_user).name}"
    page.text.wont_include "#{users(:user).name}"
    page.has_css? ".alert alert-warning"
    page.must_have_content "Home"
  end

end

