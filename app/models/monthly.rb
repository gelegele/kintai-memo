class Monthly < ActiveRecord::Base
  belongs_to :users
  has_many :time_records, :dependent => :destroy, :order => 'date'
  attr_accessible :user_id, :year, :month
  validates :year,
    :presence => true,
    :inclusion => 1970..2030
  validates :month,
    :presence => true,
    :inclusion => 1..12,
    :uniqueness => {:scope => [:user_id, :year]}
end
