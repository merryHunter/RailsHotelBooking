class ProfileController < ApplicationController
  before_filter :authenticate_user!, :init

  def book

    @request = Request.new
    if request.get?

    elsif request.post?
      logger.debug("POST")
      @request.status = -1
      if @request.save
        respond_to do |format|
          format.html { redirect_to bookings_path , notice: "Booked!"}
          format.json { head :no_content }
        end
      end
    end
  end

  private
  def init
    @apartment_types = ApartmentType.all
  end
end
