class EventsController < ApplicationController
  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id].to_i)
  end
end
