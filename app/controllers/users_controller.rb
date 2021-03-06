class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "yay!"
      redirect_to root_path
    else
      flash[:notice] = "nope"
      render :new
    end
  end

    private
    def user_params
      params.require(:user).permit(:username, :password)
    end
end
