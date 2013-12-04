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
    within "#signin" do
      fill_in "user[email]", with: users(:user).email
      fill_in "Password", with: "password"
    end

    click_on "Sign in"
  end

  def sign_out
    click_on "Home"
    click_on "Sign Out"
  end

  def sign_in_as_public_user
    visit '/'
    within "#signin" do
      fill_in "user[email]", with: users(:public_user).email
      fill_in "Password", with: "password"
    end

    click_on "Sign in"
  end

  def create_container
    #Given a signed-in user
    click_on "Sign Out"

    within("#signup") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"
    page.text.must_include "Test Guy"
    #When the user clicks the add container button in the main window
    page.find('#new_container_plus').click
    # #Then a modal window form should appear, and is filled in
    fill_in "Name", with: "A container"
    fill_in "Description", with: "A description"
    click_on "Create Container"
    # save_and_open_page
    # #Then the resulting page should show the new container in the index
    page.has_content? "A container"
    page.has_content? "A description"
    page.has_css? ".alert alert-success"
    page.has_content? "Container was successfully created."
  end

  def create_eleven_containers
    visit '/'

    within("#signup") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"
    page.text.must_include "Test Guy"
    #When the user clicks the add container button in the main window
    11.times do |i|
    page.find('#new_container_plus').click
    # #Then a modal window form should appear, and is filled in
    fill_in "Name", with: "container #{i}"
    fill_in "Description", with: "A description"
    click_on "Create Container"
    end
  end

  def create_link
    #Then a modal window form should appear, and is filled in
    within("#container_2") do
        find("#show").click
    end

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

  def create_staging_link
    within "#custom-well-left" do
      find("#stagingnew").click
    end
    fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"
  end

  def create_starred_container
    # Given a new user
    visit root_path
    within("#signup") do
      fill_in "Full Name", with: "Test Guy"
      fill_in "Enter email", with: "tester@example.com"
      fill_in "Password", with: "test1234"
      fill_in "Confirm password", with: "test1234"
    end

    click_on "Sign up"
    page.text.must_include "Test Guy"

    # no containers are starred by default
    page.text.wont_include "★"

    # and the user updates the default container to be starred
    click_on "edit_container_2"
    check "Important"
    click_on "Update Container"

    # the star will appear on the main view
    page.text.must_include "★"
  end
end
