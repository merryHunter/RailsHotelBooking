class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :init_apartment_types_hash, :set_i18n_locale_from_params

  protect_from_forgery

  private
    def authenticate_admin
      unless current_user.admin?
        redirect_to new_user_session_path, notice: 'Please, login as admin!'
      end
    end

  protected
    def init_apartment_types_hash
      @apartment_types = ApartmentType.all
      @apartment_hash = {}
      @apartment_types.each do |a|

        @apartment_hash[a.id.to_s] = a.title
      end
      @apartment_hash
    end

  def set_i18n_locale_from_params
    if params[:locale]
      if I18n.available_locales.include?(params[:locale].to_sym)
        I18n.locale = params[:locale]
      else
        flash.now[:notice] =
            "#{params[:locale]} translation not available"
        logger.error flash.now[:notice]
      end
    end
  end
  def default_url_options
    { locale: I18n.locale }
  end

end
