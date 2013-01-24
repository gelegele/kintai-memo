require 'test_helper'

class MonthliesControllerTest < ActionController::TestCase
  setup do
    @monthly = monthlies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monthlies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create monthly" do
    assert_difference('Monthly.count') do
      post :create, monthly: { month: @monthly.month, user_id: @monthly.user_id, year: @monthly.year }
    end

    assert_redirected_to monthly_path(assigns(:monthly))
  end

  test "should show monthly" do
    get :show, id: @monthly
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @monthly
    assert_response :success
  end

  test "should update monthly" do
    put :update, id: @monthly, monthly: { month: @monthly.month, user_id: @monthly.user_id, year: @monthly.year }
    assert_redirected_to monthly_path(assigns(:monthly))
  end

  test "should destroy monthly" do
    assert_difference('Monthly.count', -1) do
      delete :destroy, id: @monthly
    end

    assert_redirected_to monthlies_path
  end
end
