require 'test_helper'

class MotorbikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get motorbikes_index_url
    assert_response :success
  end

  test "should get new" do
    get motorbikes_new_url
    assert_response :success
  end

  test "should get create" do
    get motorbikes_create_url
    assert_response :success
  end

  test "should get show" do
    get motorbikes_show_url
    assert_response :success
  end

  test "should get edit" do
    get motorbikes_edit_url
    assert_response :success
  end

  test "should get update" do
    get motorbikes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get motorbikes_destroy_url
    assert_response :success
  end

end
