class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  def index
    if params[:set_locale]
      redirect_to home_path(locale: params[:set_locale])
    end
  end
end
