require "test_helper"

feature "A user can change a container starred settings" do

  scenario "User checks box on edit container page" do
    create_starred_container
  end

  scenario "Containers with stars are listed first" do
    # Given a starred container
    create_starred_container

    # and a newly created, non-starred container
    page.find('#new_container_plus').click

    fill_in "Name", with: "2nd container"
    fill_in "Description", with: "A description"
    click_on "Create Container"

    # the starred container will preceed the unstarred container
    page.text =~ /Start.*2nd/

    # and when the unstarred container is starred,
    click_on "edit_container_3"
    check "Important"
    click_on "Update Container"

    # it will preceed the previously starred container, as it was starred more recently.
    page.text =~ /2nd.*Start/
  end
end

