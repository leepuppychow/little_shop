class Admin::AnalyticsController < Admin::BaseController

  def index
    @user = current_user
    @categories = Category.all
    @items = Item.ordered_by_retired_count
  end

end
