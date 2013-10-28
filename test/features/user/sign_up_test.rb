require "test_helper"

class User::SignUpTest < Capybara::Rails::TestCase
  test "user sign up" do

    visit root_path

    fill_in "Enter email", with: "tester@example.com"
    fill_in "Password", with: "test1234"
    fill_in "Password confirmation", with: "test1234"

    click_on "Sign up"

    page.text.must_include "Welcome! You have signed up successfully."
  end
end
