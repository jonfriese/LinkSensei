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
    click_on "Sign Out"

    within("//div[@id='signup']") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"
    page.text.must_include "Test Guy"
    #When the user clicks the add container button in the main window
    page.find('#new_container"').click
    # #Then a modal window form should appear, and is filled in
    fill_in "Name", with: "A container"
    fill_in "Description", with: "A description"
    click_on "Create Container"
    # save_and_open_page
    # #Then the resulting page should show the new container in the index
    page.has_content? "A container"
    page.has_content? "A description"

  end

  def create_link
    #Then a modal window form should appear, and is filled in
    page.find("#show").click
    page.find("#add_link").click
    fill_in "Url", with: "www.google.com"
    fill_in "Name", with: "Google"
    fill_in "Description", with: "a search engine"
    click_on "Create Link"

    # #Then the resulting page should show the new link in the staging area
    page.has_content? "Google"
    page.has_content? "www.google.com"
    page.has_content? "a search engine"
    page.has_content? "Show"
    page.has_content? "Edit"
    page.has_content? "Destroy"
  end

end
