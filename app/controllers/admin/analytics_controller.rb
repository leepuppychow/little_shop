class Admin::AnalyticsController < Admin::BaseController

  def index
    @user = current_user
    @categories = Category.highest_priced_item_per_category
  end

end
