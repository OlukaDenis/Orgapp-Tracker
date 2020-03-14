class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # Confirms the signed in user
  def signed_in_user
    unless signed_in?
      redirect_to signin_url
      flash[:danger] = 'Please signin first!'
    end
  end
end
