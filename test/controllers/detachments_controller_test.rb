require "test_helper"

class DetachmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get detachments_index_url
    assert_response :success
  end

  test "should get new" do
    get detachments_new_url
    assert_response :success
  end

  test "should get show" do
    get detachments_show_url
    assert_response :success
  end
end
