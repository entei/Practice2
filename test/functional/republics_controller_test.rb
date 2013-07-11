require 'test_helper'

class RepublicsControllerTest < ActionController::TestCase
  setup do
    @republic = republics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:republics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create republic" do
    assert_difference('Republic.count') do
      post :create, republic: {  }
    end

    assert_redirected_to republic_path(assigns(:republic))
  end

  test "should show republic" do
    get :show, id: @republic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @republic
    assert_response :success
  end

  test "should update republic" do
    put :update, id: @republic, republic: {  }
    assert_redirected_to republic_path(assigns(:republic))
  end

  test "should destroy republic" do
    assert_difference('Republic.count', -1) do
      delete :destroy, id: @republic
    end

    assert_redirected_to republics_path
  end
end
