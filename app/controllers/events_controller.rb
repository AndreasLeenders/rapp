class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update]
  before_action :set_user

  def index
    @events = Event.all
  end

  def show
    @event
  end

  def edit
    if !is_organiser?
      puts "You\'re not allowed to access this page"
      redirect_to events_path
    end
  end

  def update
#     if is_organiser?
#       if @event.update(event_params)
# +     redirect_to event_path(@event), notice: 'Event was successfully updated.'
#       else
#         render: edit
#       end
#     end
  end

  def create
  end

  def destroy
  end

  private

  def set_event
    @event = Event.find(params[:id].to_i)
  end

  def set_user
    @user = User.find(current_user.id)
  end

  def is_organiser?
    return true if @user.is_organiser == true
  end

  def is_band?
    return true if @user.is_band == true
  end

end
