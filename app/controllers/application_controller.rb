class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # Confirms the signed in user
  def signed_in_user
    redirect_to signin_url, notice: 'Please signin first!' unless signed_in?
  end
end
