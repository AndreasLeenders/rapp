class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def show
    @event
  end

  def edit
    if !is_organiser? || @user.id != @event.organiser_id
      puts "You\'re not allowed to access this page"
      redirect_to events_path
    end
  end

  def update
    if is_organiser? && @user.id == @event.organiser_id
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
    @event.organiser_id = current_user.organisers.first.id
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
    @events = Event.where ("city LIKE '%#{params[:event][:city].downcase}%'")
  end

  private

  def set_event
    @event = Event.find(params[:id].to_i)
  end

  def is_organiser?
    return true if @user.is_organiser == true
  end

  def is_band?
    return true if @user.is_band == true
  end

  def event_params
    params.require(:event).permit(:name, :date_begin, :date_end, :capacity, :equipment, :price, :commodities, :location, :pictures)
  end
end
