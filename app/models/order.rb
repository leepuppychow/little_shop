class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  has_many :items, through: :order_items
  validates_presence_of :status, :total_price, :created_at, :updated_at

end
