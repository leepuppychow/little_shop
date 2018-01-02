class Item < ApplicationRecord
  validates :name, :description, :price, :image, presence: true
  belongs_to :category

end
