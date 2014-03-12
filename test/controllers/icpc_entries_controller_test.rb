require 'test_helper'

class IcpcEntriesControllerTest < ActionController::TestCase
  setup do
    @icpc_entry = icpc_entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:icpc_entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create icpc_entry" do
    assert_difference('IcpcEntry.count') do
      post :create, icpc_entry: {  }
    end

    assert_redirected_to icpc_entry_path(assigns(:icpc_entry))
  end

  test "should show icpc_entry" do
    get :show, id: @icpc_entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @icpc_entry
    assert_response :success
  end

  test "should update icpc_entry" do
    patch :update, id: @icpc_entry, icpc_entry: {  }
    assert_redirected_to icpc_entry_path(assigns(:icpc_entry))
  end

  test "should destroy icpc_entry" do
    assert_difference('IcpcEntry.count', -1) do
      delete :destroy, id: @icpc_entry
    end

    assert_redirected_to icpc_entries_path
  end
end
