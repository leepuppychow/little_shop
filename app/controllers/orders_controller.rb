class OrdersController < ApplicationController

  def index
    @orders = current_user.orders
  end

  def create
    @order = Order.create!(status: "Ordered", user_id: current_user.id, created_at: Date.today, updated_at: Date.today, total_price: 0)
    # @cart.create_order_items(@order)
    @cart.contents.each do |item_id, quantity|
      oi = OrderItem.create!(order_id: @order.id, item_id: item_id.to_i, original_price: Item.find(item_id.to_s).price, quantity: quantity)
      oi.update(sub_total: oi.original_price * oi.quantity)
    end
    @order.update(total_price: OrderItem.total_price_of_order(@order))
    # binding.pry
    flash[:notice] = "Order was successfully placed"
    @cart.contents.clear
    redirect_to orders_path
  end

end
