class OrderItem < ApplicationRecord
  belongs_to :item
  belongs_to :order

  # def self.subtotal(order)
  #   where(order_id: order.id)
  # end
  #
  def self.total_price_of_order(order)
    where(order_id: order.id).sum(:sub_total)
  end

end
