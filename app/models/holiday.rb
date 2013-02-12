class Holiday < ActiveRecord::Base
  attr_accessible :date, :summary
  validates :date,
    :presence => true,
    :uniqueness => true
end
