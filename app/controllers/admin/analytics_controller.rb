class Admin::AnalyticsController < Admin::BaseController

  def index
    @user = current_user
    @categories = Category.all
    @items = Item.ordered_by_retired_count
    if params[:sort_by] == "count"
      @orders = Order.states_with_count_of_orders_sorted_by_count
    else
      @orders = Order.states_with_count_of_orders
    end
  end

end
