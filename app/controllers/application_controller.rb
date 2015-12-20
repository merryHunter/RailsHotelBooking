class ApplicationController < ActionController::Base
  before_filter :authenticate_user!, :init_apartment_types_hash

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
        @apartment_hash[a.id] = a.title
      end
      @apartment_hash
    end

end
