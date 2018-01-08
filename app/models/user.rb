class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username, :password
  has_many :orders

  enum role: ["user", "admin"]

  def user_with_most_orders
    User.where(id: Order.user_count).first
  end
end
