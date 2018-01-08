class Admin::DashboardController < Admin::BaseController

  def index
    if params[:status] == "All" || !params[:status]
      @orders = Order.all
    else
      @orders = Order.where(status: params[:status])
    end
    @orders_by_status = Order.group_by_status_count
    @statuses = Order.pluck(:status).uniq.unshift("All")
  end

end
