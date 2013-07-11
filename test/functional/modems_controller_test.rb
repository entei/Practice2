require 'test_helper'

class ModemsControllerTest < ActionController::TestCase
  setup do
    @modem = modems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:modems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create modem" do
    assert_difference('Modem.count') do
      post :create, modem: { comment: @modem.comment, commissioning: @modem.commissioning, decommissioning: @modem.decommissioning, model: @modem.model, modem_type: @modem.modem_type, source: @modem.source, speed: @modem.speed, station_id: @modem.station_id, task: @modem.task }
    end

    assert_redirected_to modem_path(assigns(:modem))
  end

  test "should show modem" do
    get :show, id: @modem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @modem
    assert_response :success
  end

  test "should update modem" do
    put :update, id: @modem, modem: { comment: @modem.comment, commissioning: @modem.commissioning, decommissioning: @modem.decommissioning, model: @modem.model, modem_type: @modem.modem_type, source: @modem.source, speed: @modem.speed, station_id: @modem.station_id, task: @modem.task }
    assert_redirected_to modem_path(assigns(:modem))
  end

  test "should destroy modem" do
    assert_difference('Modem.count', -1) do
      delete :destroy, id: @modem
    end

    assert_redirected_to modems_path
  end
end
