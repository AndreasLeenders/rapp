class BookingsController < ApplicationController


  def index
    if current_user.is_band
    @bookings = current_user.band.bookings
    elsif current_user.is_organiser
    @bookings = current_user.organiser.bookings
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
    @event = Event.find(params[:event_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.band = current_user.band
    @booking.event = Event.find(params[:event_id])
    elsif @booking.save
      redirect_to "/my_bookings"
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
    set_booking
    @booking.update(booking_params)
    redirect_to "/my_bookings"
  end

  private



  def booking_params
    params.require(:booking).permit(:status, :message, :answer, :event_id, :band_id)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
