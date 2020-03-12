# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # Confirms the signed in user
  def signed_in_user
    unless signed_in?
      flash[:danger] = 'Please signin first!'
      redirect_to signin_url
    end
  end
end
