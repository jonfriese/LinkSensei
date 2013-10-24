require "test_helper"

class AccessHomeTest < Capybara::Rails::TestCase
  test "sanity" do
    visit root_path
     page.text.must_include "Here we go"
  end
end
