require 'test_helper'

class GnodesControllerTest < ActionController::TestCase
  setup do
    @gnode = gnodes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gnodes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gnode" do
    assert_difference('Gnode.count') do
      post :create, gnode: {  }
    end

    assert_redirected_to gnode_path(assigns(:gnode))
  end

  test "should show gnode" do
    get :show, id: @gnode
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gnode
    assert_response :success
  end

  test "should update gnode" do
    put :update, id: @gnode, gnode: {  }
    assert_redirected_to gnode_path(assigns(:gnode))
  end

  test "should destroy gnode" do
    assert_difference('Gnode.count', -1) do
      delete :destroy, id: @gnode
    end

    assert_redirected_to gnodes_path
  end
end
