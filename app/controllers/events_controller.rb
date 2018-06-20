class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :search, :show]
  def index
    @events = Event.where.not(latitude: nil, longitude: nil)

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude#,
        # infoWindow: { content: render_to_string(partial: "/events/map_box", locals: { event: event }) }
      }
    end
  end

  def show
    @event = Event.find(params[:id])
      @markers = [
        {
          lat: @event.latitude,
          lng: @event.longitude#,
          # infoWindow: { content: render_to_string(partial: "/events/map_box", locals: { event: event }) }
        } ]

  end

  def show_user_events
    if current_user.is_organiser
    organiser = Organiser.find_by user_id: current_user.id
    @events = Event.where("organiser_id = #{organiser.id}")
    end
  end

  def edit
    if !is_organiser? || current_user.organiser.id != @event.organiser_id
      puts "You\'re not allowed to access this page"
      redirect_to events_path
    end
  end

  def update
    if is_organiser? && current_user.id == @event.organiser_id
      if @event.update(event_params)
       redirect_to event_path(@event)
      else
        render :edit
      end
    end
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.organiser_id = current_user.organiser.id
    if @event.save
      redirect_to event_path(@event),  notice: 'Organiser was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path
  end

  def search
    @events = Event.where ("address LIKE '%#{params[:event][:city].downcase}%'")

    @markers = @events.map do |event|
      {
        lat: event.latitude,
        lng: event.longitude#,
        # infoWindow: { content: render_to_string(partial: "/events/map_box", locals: { event: event }) }
      }
    end
  end

  private

  def set_event
    @event = Event.find(params[:id].to_i)
  end

  def is_organiser?
    return true if current_user.is_band == false
  end

  def is_band?
    return true if current_user.is_band == true
  end

  def event_params
    params.require(:event).permit(:name, :date_begin, :date_end, :capacity, :equipment, :price, :commodities, :city, :pictures)
  end
end
