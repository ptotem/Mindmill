require 'test_helper'

class GpathsControllerTest < ActionController::TestCase
  setup do
    @gpath = gpaths(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gpaths)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gpath" do
    assert_difference('Gpath.count') do
      post :create, gpath: {  }
    end

    assert_redirected_to gpath_path(assigns(:gpath))
  end

  test "should show gpath" do
    get :show, id: @gpath
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gpath
    assert_response :success
  end

  test "should update gpath" do
    put :update, id: @gpath, gpath: {  }
    assert_redirected_to gpath_path(assigns(:gpath))
  end

  test "should destroy gpath" do
    assert_difference('Gpath.count', -1) do
      delete :destroy, id: @gpath
    end

    assert_redirected_to gpaths_path
  end
end
