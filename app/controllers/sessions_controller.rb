# frozen_string_literal: true

class SessionsController < ApplicationController
  before_action :signed_in_user, only: %(destroy)
  def new
    redirect_to root_url if signed_in?
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      signin user
      redirect_to root_url
    else
      render 'new'
      flash[:danger] = 'Wrong username'
    end
  end

  def destroy
    signout if signed_in?
    flash[:warning] = 'You have been signed out successfully'
    redirect_to signin_url
  end
end
