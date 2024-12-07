require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get createPage" do
    get pages_createPage_url
    assert_response :success
  end
end
