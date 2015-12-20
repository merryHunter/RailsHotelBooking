class ApplicationController < ActionController::Base
  before_filter :authenticate_user!

  protect_from_forgery

  def authenticate_admin
    unless current_user.try(:admin?)
      redirect_to new_user_session_path, notice: 'Please, login as admin!'
    end
  end

end
