class TimeRecord < ActiveRecord::Base
  belongs_to :user
  attr_accessible :monthly_id, :date, :in, :note, :out

  validates :monthly_id,
    :presence => 'true'
  validates :date,
    :presence => 'true'
  validates :in,
    :time => {:less_than => 'out', :allow_nil => true}
end
