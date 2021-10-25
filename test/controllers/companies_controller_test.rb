require "test_helper"

class CompaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get community" do
    get companies_community_url
    assert_response :success
  end
end
