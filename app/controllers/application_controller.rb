class ApplicationController < ActionController::Base

  def forem_user
    current_member
  end
  helper_method :forem_user

  protect_from_forgery
end
