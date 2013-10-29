require "test_helper"

class User::SignOutTest < Capybara::Rails::TestCase
  test "A user can sign out" do

    sign_in

    visit

    click_on "Sign Out"

    page.text.must_include "Signed out successfully."
  end
end
