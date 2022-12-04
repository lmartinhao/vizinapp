require "test_helper"

class CondosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get condos_index_url
    assert_response :success
  end

  test "should get new" do
    get condos_new_url
    assert_response :success
  end

  test "should get create" do
    get condos_create_url
    assert_response :success
  end
end
