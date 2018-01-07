class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Logged in as #{@user.username}"
      redirect_to dashboard_path(id: @user.id)
    else
      render :new
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out"
    redirect_to root_path
  end

end
