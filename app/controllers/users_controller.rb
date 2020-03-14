class UsersController < ApplicationController
  before_action :signed_in_user, only: %(show)
  def new
    @user = User.new
    redirect_to root_url if signed_in?
  end

  def create
    @user = User.new(user_params)
    
    if @user.valid?
      if usr = User.find_by(name: @user.name.downcase)
        render 'new'
        flash[:danger] = 'Username already taken, choose a different username!'
      else  
        @user.save
        signin @user
        redirect_to root_url
      end
    else
      render 'new'
      flash[:danger] = 'Invalid username!'
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
