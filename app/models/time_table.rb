class TimeTable < ActiveRecord::Base
  belongs_to :user
  has_many :working_times
  attr_accessible :fixed_end_hours, :fixed_end_minutes, :fixed_start_hours, :fixed_start_minutes

  validates :fixed_start_hours,
    :presence => true,
    :inclusion => 0..23,
    :uniqueness => {:scope => [:user_id, :fixed_start_minutes]},
    :numericality => {:less_than_or_equal_to => :fixed_end_hours}
  validates :fixed_start_minutes,
    :presence => true,
    :inclusion => 0..59
  #TODO fixed_start_minutes < fixed_end_minutes when fixed_start_hours == fixed_end_hours
  validates :fixed_end_hours,
    :presence => true,
    :inclusion => 0..23,
    :uniqueness => {:scope => [:user_id, :fixed_end_minutes]}
  validates :fixed_end_minutes,
    :presence => true,
    :inclusion => 0..59
end
