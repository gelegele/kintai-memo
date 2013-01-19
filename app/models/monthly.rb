class Monthly < ActiveRecord::Base
  belongs_to :users 
  attr_accessible :user_id, :year, :month
  validates :year,
    :presence => true
  validates :month,
    :presence => true
end
