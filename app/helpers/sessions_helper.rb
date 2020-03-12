# frozen_string_literal: true

module SessionsHelper
  # Store a signed in user
  def signin(user)
    session[:author_id] = user.id
  end

  # get the current signed in user
  def current_user
    if session[:author_id]
      @current_user ||= User.find_by(id: session[:author_id])
      end
  end

  # Return true if a user is signed in
  def signed_in?
    !current_user.nil?
  end

  # signout the user
  def signout
    session.delete(:author_id)
    @current_user = nil
  end
end
