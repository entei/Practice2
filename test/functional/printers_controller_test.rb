require 'test_helper'

class PrintersControllerTest < ActionController::TestCase
  setup do
    @printer = printers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:printers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create printer" do
    assert_difference('Printer.count') do
      post :create, printer: { chroma: @printer.chroma, comment: @printer.comment, commissioning: @printer.commissioning, decommissioning: @printer.decommissioning, device: @printer.device, page_format: @printer.page_format, printer_model: @printer.printer_model, printer_type: @printer.printer_type, source: @printer.source, task: @printer.task }
    end

    assert_redirected_to printer_path(assigns(:printer))
  end

  test "should show printer" do
    get :show, id: @printer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @printer
    assert_response :success
  end

  test "should update printer" do
    put :update, id: @printer, printer: { chroma: @printer.chroma, comment: @printer.comment, commissioning: @printer.commissioning, decommissioning: @printer.decommissioning, device: @printer.device, page_format: @printer.page_format, printer_model: @printer.printer_model, printer_type: @printer.printer_type, source: @printer.source, task: @printer.task }
    assert_redirected_to printer_path(assigns(:printer))
  end

  test "should destroy printer" do
    assert_difference('Printer.count', -1) do
      delete :destroy, id: @printer
    end

    assert_redirected_to printers_path
  end
end
