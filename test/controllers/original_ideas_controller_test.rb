require "test_helper"

class OriginalIdeasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get original_ideas_index_url
    assert_response :success
  end

  test "should get show" do
    get original_ideas_show_url
    assert_response :success
  end
end
