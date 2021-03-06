class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "Successful Login"
      redirect_to root_path
    else
      flash[:notice] = 'Get Out'
      render :new
    end
  end
end
