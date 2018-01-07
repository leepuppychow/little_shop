class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
      verify_admin
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

  private

    def verify_admin
      if current_admin?
        redirect_to admin_dashboard_path
      else
        redirect_to dashboard_path
      end
    end

end
