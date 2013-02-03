class WorkingTime < ActiveRecord::Base
  belongs_to :user
  attr_accessible :end_hours, :end_minutes, :start_hours, :start_minutes

  validates :start_hours,
    :presence => true,
    :inclusion => 0..23,
    :uniqueness => {:scope => [:user_id, :start_minutes]},
    :numericality => {:less_than_or_equal_to => :end_hours}
  validates :start_minutes,
    :presence => true,
    :inclusion => 0..59
  #TODO start_minutes < end_minutes when start_hours == end_hours
  validates :end_hours,
    :presence => true,
    :inclusion => 0..23,
    :uniqueness => {:scope => [:user_id, :end_minutes]}
  validates :end_minutes,
    :presence => true,
    :inclusion => 0..59
end
