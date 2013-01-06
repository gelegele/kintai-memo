class TimeRecord < ActiveRecord::Base
  belongs_to :user
  attr_accessible :date, :in, :note, :out, :type
end
