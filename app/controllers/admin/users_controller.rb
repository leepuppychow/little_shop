class Admin::UsersController < Admin::BaseController

  def edit
    @user = current_user if current_user.admin?
  end

  def update
    if current_user.update(admin_params)
      @user = current_user
      redirect_to admin_dashboard_path
    else
      render :edit
    end
  end

  private

    def admin_params
      params.require(:user).permit(:username, :password)
    end

end
