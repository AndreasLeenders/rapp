class RatingsController < ApplicationController

  def new
    @booking = Booking.find(params[:booking_id])
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)
    @booking = Booking.find(params[:booking_id])
    @rating.booking = @booking
    @rating = @booking

     if @rating.save
      redirect_to "/my_bookings"
    else
      render :new
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to "/my_bookings"
  end

  private

  def rating_params
    params.require(:rating).permit(:stars)
  end
end



