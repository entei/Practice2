require 'test_helper'

class ComputersControllerTest < ActionController::TestCase
  setup do
    @computer = computers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:computers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create computer" do
    assert_difference('Computer.count') do
      post :create, computer: { comment: @computer.comment, commissioning: @computer.commissioning, comp_class: @computer.comp_class, comp_type: @computer.comp_type, computer_model: @computer.computer_model, decommissioning: @computer.decommissioning, display: @computer.display, hdd: @computer.hdd, memory: @computer.memory, platform: @computer.platform, processor: @computer.processor, source: @computer.source, task: @computer.task }
    end

    assert_redirected_to computer_path(assigns(:computer))
  end

  test "should show computer" do
    get :show, id: @computer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @computer
    assert_response :success
  end

  test "should update computer" do
    put :update, id: @computer, computer: { comment: @computer.comment, commissioning: @computer.commissioning, comp_class: @computer.comp_class, comp_type: @computer.comp_type, computer_model: @computer.computer_model, decommissioning: @computer.decommissioning, display: @computer.display, hdd: @computer.hdd, memory: @computer.memory, platform: @computer.platform, processor: @computer.processor, source: @computer.source, task: @computer.task }
    assert_redirected_to computer_path(assigns(:computer))
  end

  test "should destroy computer" do
    assert_difference('Computer.count', -1) do
      delete :destroy, id: @computer
    end

    assert_redirected_to computers_path
  end
end
