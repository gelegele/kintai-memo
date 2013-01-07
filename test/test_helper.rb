ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def new_user
    User.new({
      email: 'hoge@hoge',
      password: 'hoge',
      password_confirmation: 'hoge'
      })
  end

  def new_time_record
    TimeRecord.new({
      user_id: '1',
      date: Time.now,
      in: Time.now,
      out: Time.now,
      note: 'hoge'
      })
  end

end
