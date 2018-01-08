class Admin::DashboardController < Admin::BaseController

  def index
    if params[:status]
      @orders = Order.where(status: params[:status])
    else
      @orders = Order.all
    end
    @orders_by_status = Order.group_by_status_count
    @statuses = Order.pluck(:status).uniq
  end

end
