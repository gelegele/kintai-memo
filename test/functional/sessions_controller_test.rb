require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  def setup
    User.create(email:'taro@h.com', password:'taro', password_confirmation:'taro')
  end

  test "should post create" do

    post :create, {email:'taro@h.com', password:'taro', password_confirmation:'taro', referer:time_records_url}
    assert_redirected_to time_records_url
  end

  test "should not post create without email" do
    post :create, {password:'taro', password_confirmation:'taro'}
    assert_redirected_to login_url
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete destroy" do
    delete :destroy, {id:1}
    assert_redirected_to login_url
  end

end
