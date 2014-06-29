require 'test_helper'

class AcmProjectsControllerTest < ActionController::TestCase
  setup do
    @acm_project = acm_projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acm_projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acm_project" do
    assert_difference('AcmProject.count') do
      post :create, acm_project: { description: @acm_project.description, name: @acm_project.name, owner_id: @acm_project.owner_id, status: @acm_project.status }
    end

    assert_redirected_to acm_project_path(assigns(:acm_project))
  end

  test "should show acm_project" do
    get :show, id: @acm_project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acm_project
    assert_response :success
  end

  test "should update acm_project" do
    patch :update, id: @acm_project, acm_project: { description: @acm_project.description, name: @acm_project.name, owner_id: @acm_project.owner_id, status: @acm_project.status }
    assert_redirected_to acm_project_path(assigns(:acm_project))
  end

  test "should destroy acm_project" do
    assert_difference('AcmProject.count', -1) do
      delete :destroy, id: @acm_project
    end

    assert_redirected_to acm_projects_path
  end
end
