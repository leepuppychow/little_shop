class Item < ApplicationRecord
  validates :description, :price, :status, :image, presence: true
  validates :name, presence: true, uniqueness: true
  validates :image, format: {with: /\.(png|jpg)\Z/i}
  belongs_to :category
  has_many :order_items
  has_many :orders, through: :order_items
  scope :ordered_by_retired_count, -> {order("retired_count DESC")}
  scope :ordered_by_id, -> {order(:id)}
  before_validation :default_image

  def default_image
    if self.image == ""
      self.image = 'https://orig00.deviantart.net/d878/f/2008/264/4/3/kalin__s_jedi_lightsaber_by_cascador.jpg'
    end
  end

  def quantity_for_single_order(order)
    order_items.where(order_id: order.id).sum(:quantity)
  end

  def subtotal_for_single_order(order)
    order_items.where(order_id: order.id).sum(:sub_total)
  end
end
