class TimeTable < ActiveRecord::Base
  belongs_to :user
  attr_accessible :fixed_end_hours, :fixed_end_minutes, :fixed_start_hours, :fixed_start_minutes
end
