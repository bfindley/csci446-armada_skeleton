require 'test_helper'

class FightersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fighters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fighter" do
    assert_difference('Fighter.count') do
      post :create, :fighter => { }
    end

    assert_redirected_to fighter_path(assigns(:fighter))
  end

  test "should show fighter" do
    get :show, :id => fighters(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => fighters(:one).to_param
    assert_response :success
  end

  test "should update fighter" do
    put :update, :id => fighters(:one).to_param, :fighter => { }
    assert_redirected_to fighter_path(assigns(:fighter))
  end

  test "should destroy fighter" do
    assert_difference('Fighter.count', -1) do
      delete :destroy, :id => fighters(:one).to_param
    end

    assert_redirected_to fighters_path
  end
end
