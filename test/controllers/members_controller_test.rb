require 'test_helper'

class MembersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get members_new_url
    assert_response :success
  end

  test "should get results" do
    get members_results_url
    assert_response :success
  end

end
