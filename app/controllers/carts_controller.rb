class CartsController < ApplicationController

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    flash[:notice] = "#{item.name} was added to your cart!"
    redirect_to items_path
  end

end
