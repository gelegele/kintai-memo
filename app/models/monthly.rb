class Monthly < ActiveRecord::Base
  belongs_to :users
  has_many :time_records, :dependent => :destroy, :order => 'date'
  attr_accessible :monthly_id, :year, :month
  validates :year,
    :presence => true
  validates :month,
    :presence => true
end
