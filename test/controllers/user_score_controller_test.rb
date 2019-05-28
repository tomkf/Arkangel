require 'test_helper'

class UserScoreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get user_score_new_url
    assert_response :success
  end

  test "should get create" do
    get user_score_create_url
    assert_response :success
  end

end
