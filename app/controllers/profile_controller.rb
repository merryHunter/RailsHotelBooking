class ProfileController < ApplicationController
  before_filter :authenticate_user!

  def book
    @booking = Booking.new
    if request.get?

    elsif request.post?

    end
  end
end
