require "test_helper"

class User::SignInTest < Capybara::Rails::TestCase
  test "A user can sign in" do
    visit root_path

    sign_in

    page.text.must_include "Signed in successfully."
  end
end
