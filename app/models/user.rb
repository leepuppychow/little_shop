class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password, :full_name, :address
  has_many :orders

  enum role: ["user", "admin"]
end
