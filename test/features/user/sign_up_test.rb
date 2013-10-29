require "test_helper"

class User::SignUpTest < Capybara::Rails::TestCase
  test "user sign up" do

    visit root_path

    within("//div[@id='signup']") do
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"

    page.text.must_include "Welcome! You have signed up successfully."
  end
end
