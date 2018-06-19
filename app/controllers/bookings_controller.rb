class BookingsController < ApplicationController
  before_action :set_band

  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.band = @band
    if @booking.save
      redirect_to band_booking_path(@booking.band)
    else
      render "/bookings/new"
    end
  end

  def destroy
    set_booking
    @booking.destroy
    redirect_to band_booking_path(@booking.band)
  end

  def edit
    set_booking
  end

  def update
    @booking.update(booking_params)
    redirect_to band_booking_path(@booking.band)
  end

  private

  def booking_params
    params.require(:booking).permit(:status)
  end

  def set_band
    @band = Band.find(params[:band_id])
  end

  def set_booking
    @booking = booking.find(params[:id])
  end
end
