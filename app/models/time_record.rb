class TimeRecord < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :date, :in, :note, :out, :type

  validates :user_id,
    :presence => 'true'
  validates :date,
    :presence => 'true'
end
