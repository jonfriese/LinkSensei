require "test_helper"
require "pry"

feature "As a site user, I want to to add a link to my collection so that I use it in the future" do

  #happy paths
  scenario "User creates a new link in an existing container" do
    sign_in
    create_container

    within "#container_3" do
      click_on "add_link"
    end

    fill_in "Url", with: "www.test.com"
    fill_in "Name", with: "Test"
    click_on "Create Link"
    #Then the resulting page should show the new link in the chosen container

    within "#container_3" do
      has_content? "test.com"
      has_content? "Test"
    end
    page.has_css? ".alert alert-success"
    page.has_content? "Link was successfully created."
  end

  scenario "User creates a new link with a long name in an existing container and expands container to full page view" do
    sign_in
    create_container

    within "#container_3" do
      click_on "add_link"
    end

    fill_in "Url", with: "www.example.com"
    fill_in "Name", with: "Test"
    fill_in "Description", with: "test test test test test test test test "
    click_on "Create Link"
    #Then the resulting page should show the new link in the chosen container

    within "#container_3" do
      has_content? "example.com"
      has_content? "Test"
      has_content? "..." #desription is reduced
    end
    page.has_css? ".alert alert-success"
    page.has_content? "Link was successfully created."

    within "#container_3" do
     find("#show").click
    end
    page.text.must_include "Test"
    page.text.must_include "example.com"
    page.text.must_include "test test test test test test test test " #full description
  end

  scenario "User creates a new link in the staging area" do

    sign_in
    create_container
    create_staging_link
    within "#custom-well-left" do
      has_content? "test.com"
    end
    page.has_css? ".alert alert-success"
    page.has_content? "Link was successfully created."
  end

  # scenario "User creates a new link in the staging area and moves" do
  #   sign_in
  #   create_container

  #   within "#custom-well-left" do
  #     find("#stagingnew").click
  #   end
  #   fill_in "Url", with: "www.test.com"
  #   fill_in "Name", with: "Test"
  #   select 'A container', :from => 'link_container_id'
  #   click_on "Create Link"
  #   binding.pry

  #   within("#container_3") do
  #     has_content? "test.com"
  #   end

  #   within("#reveal-this") do
  #     has_no_content? "test.com"
  #   end

  #   page.has_css? ".alert alert-success"
  #   page.has_content? "Link was successfully created."
  # end

  #unhappy paths
  scenario "User creates a new link in an existing container, incorrectly" do

    # Given a signed-in user
    sign_in
    create_container

    #When the user clicks the add link button
    within "#custom-well-left" do
      find("#stagingnew").click
    end
    fill_in "Url", with: ""
    fill_in "Name", with: ""
    click_on "Create Link"

    #Then the resulting page should show the new link in the staging area
    page.has_css? ".alert alert-warning"
    page.has_content? "prohibited"
    page.has_content? "Url can't be blank"
  end

  scenario "User creates a link with an invalid TLD" do
    # Given a signed-in user
    sign_in
    create_container
    within "#custom-well-left" do
      find("#stagingnew").click
    end
    fill_in "Url", with: "www.google.con" #typo
    fill_in "Name", with: "google"
    fill_in "Description", with: "search"
    click_on "Create Link"
    page.has_css? ".alert alert-warning"
    page.text.must_include "Url must have a public suffix"
  end
end
