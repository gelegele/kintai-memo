class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :email, :password, :password_confirmation
  has_many :time_records, :dependent => :destroy

  validates :email,
    :presence => true,
    :uniqueness => true
end
