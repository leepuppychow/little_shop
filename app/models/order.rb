class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_items
  has_many :items, through: :orders_items
  validates_presence_of :status, :total_price, :created_at, :updated_at

end
