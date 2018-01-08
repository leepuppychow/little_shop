class Admin::AnalyticsController < Admin::BaseController

  def index
    @user = current_user
    @categories = Category.all
  end

end
