class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :admin
  has_many :monthlies, :dependent => :destroy, :order => 'year desc, month desc'
  has_many :time_tables, :dependent => :destroy

  validates :email,
    :presence => true,
    :uniqueness => true
end
