class CartsController < ApplicationController
  # include ActionView::Helpers::TextHelper

  def create
    item = Item.find(params[:item_id])
    @cart.add_item(item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{item.name} was added to your cart!"
    redirect_to items_path
  end

  def show
    @items = @cart.cart_items
  end

  def destroy
    @item = Item.find(params[:item_id])
    @cart.remove_item(@item.id)
    session[:cart] = @cart.contents
    flash[:notice] = "#{view_context.link_to(@item.name, item_path(@item), class: "flash-remove-item")} was removed from your cart!"
    redirect_to cart_path
  end

  def update
    session[:cart][(params[:item_id]).to_s] = (params[:quantity]).to_i
    redirect_to cart_path
  end


end
