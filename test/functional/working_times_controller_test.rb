require 'test_helper'

class WorkingTimesControllerTest < ActionController::TestCase
  setup do
    @working_time = working_times(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:working_times)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create working_time" do
    assert_difference('WorkingTime.count') do
      post :create, working_time: { end_hours: @working_time.end_hours, end_minutes: @working_time.end_minutes, start_hours: @working_time.start_hours, start_minutes: @working_time.start_minutes }
    end

    assert_redirected_to working_time_path(assigns(:working_time))
  end

  test "should show working_time" do
    get :show, id: @working_time
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @working_time
    assert_response :success
  end

  test "should update working_time" do
    put :update, id: @working_time, working_time: { end_hours: @working_time.end_hours, end_minutes: @working_time.end_minutes, start_hours: @working_time.start_hours, start_minutes: @working_time.start_minutes }
    assert_redirected_to working_time_path(assigns(:working_time))
  end

  test "should destroy working_time" do
    assert_difference('WorkingTime.count', -1) do
      delete :destroy, id: @working_time
    end

    assert_redirected_to working_times_path
  end
end
