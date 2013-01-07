require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = User.create(email:'hage@hage', password: 'hage', password_confirmation: 'hage')
    @request.session = ActionController::TestSession.new
    @request.session[:user_id] = @user.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: 'hoge@h.com', password: 'hoge', password_confirmation: 'hoge'}
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    put :update, id: @user, user: { email: 'hage2@hage', password: 'hage2', password_confirmation: 'hage2'}
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
