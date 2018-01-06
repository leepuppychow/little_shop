class Item < ApplicationRecord
  validates :name, :description, :price, :image, :status, presence: true
  belongs_to :category

end
