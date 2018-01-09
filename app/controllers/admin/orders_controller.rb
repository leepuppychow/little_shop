class Admin::OrdersController < Admin::BaseController

  def show
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order.status = (params[:update_status])
    @order.save
    redirect_to admin_dashboard_path
  end

end
