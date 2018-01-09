class Item < ApplicationRecord
  validates :description, :price, :image, :status, presence: true
  validates :name, presence: true, uniqueness: true
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items

  
end
