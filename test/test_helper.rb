require 'simplecov'
SimpleCov.start

ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/rails/capybara"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in
    visit '/'
    within("//div[@id='signin']") do
      fill_in "user[email]", with: users(:user).email
      fill_in "Password", with: "password"
    end

    click_on "Sign in"
  end

  def create_container
    #Given a signed-in user
    # sign_in
    #When the user clicks the add container button in the main window
    click_on "New Container"
    # #Then a modal window form should appear, and is filled in
    fill_in "Name", with: "A container"
    fill_in "Description", with: "A description"
    click_on "Create Container"
    # save_and_open_page
    # #Then the resulting page should show the new container in the index
    page.has_content? "A container"
    page.has_content? "A description"
    page.has_content? "Show"
    page.has_content? "Edit"
    page.has_content? "Destroy"
  end
end
