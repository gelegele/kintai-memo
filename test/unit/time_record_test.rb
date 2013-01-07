require 'test_helper'

class TimeRecordTest < ActiveSupport::TestCase

  test "save" do
    tr = new_time_record
    assert tr.save, 'Failed to save'
  end

  test 'validate presence' do
    tr = TimeRecord.new({
    })
    assert !tr.save, 'Failed to validate presence'
    assert_equal tr.errors.size, 2, 'Failed to validate presence'
  end

end
