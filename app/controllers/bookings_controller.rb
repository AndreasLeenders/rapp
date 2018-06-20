class BookingsController < ApplicationController



  def index
    if current_user.is_band
    @bookings = []
    current_user.bands.each do |band|
      @bookings += band.bookings
    end
    elsif current_user.is_organiser
    @bookings = []
    current_user.organisers.each do |organiser|
      @bookings += organiser.bookings
      end
    end
  end


  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @band = Band.find(params[:band_id])
  end

  def create
    @booking = booking.find(params[:event_id])
    @booking = Booking.new(booking_params)
    @booking.band_id = @band
    if @booking.save
      redirect_to band_booking_path(@booking.band)
    else
      render :new
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

  def set_booking
    @booking = booking.find(params[:event_id])
  end
end
