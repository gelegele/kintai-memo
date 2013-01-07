require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'save' do
    user = new_user
    assert user.save, 'Failed to save'
  end

  test 'validate presence' do
    user = User.new({
    })
    assert !user.save, 'Failed to validate presence'
    assert_equal user.errors.size, 2, 'Failed to validate presence'
  end

  test 'validate confirmation' do
    user = User.new({
      email: 'hoge@hoge',
      password: 'hoge',
      password_confirmation: ''
    })
    assert !user.save, 'Failed to validate confirmation'
  end

  test 'validate uniqueness' do
    user = new_user
    assert user.save
    user2 = User.new({
      email: user.email,
      password: 'hoge',
      password_confirmation: 'hoge'
    })
    assert !user2.save, 'Failed to validate uniqueness'
  end
end
