require 'test_helper'

class SubredditsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subreddits_index_url
    assert_response :success
  end

  test "should get show" do
    get subreddits_show_url
    assert_response :success
  end

end
