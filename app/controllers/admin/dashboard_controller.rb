class Admin::DashboardController < Admin::BaseController

  def index
    @orders = Order.all
    @orders_by_status = Order.group_by_status_count
  end

end
