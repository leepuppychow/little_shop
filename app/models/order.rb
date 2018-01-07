class Order < ApplicationRecord
  belongs_to :user
  has_many :joins_table_orders_items
  has_many :items, through: :orders_items
  validates_presence_of :status, :total_price, :created_at, :updated_at

end
