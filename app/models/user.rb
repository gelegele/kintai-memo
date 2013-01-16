class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation, :admin
  has_many :time_records, :dependent => :destroy, :order => 'date'

  validates :email,
    :presence => true,
    :uniqueness => true
end
