class Admin::AnalyticsController < Admin::BaseController

  def index
    @user = current_user
  end

end
