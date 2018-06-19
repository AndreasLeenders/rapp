class EventsController < ApplicationController
  before_action

  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id].to_i)
  end

  def edit
    if !is_organiser?
      puts "You\'re not allowed to access this page"
      redirect_to events_path
    end
  end

  def update
    if is_organiser?
      if @event.update(event_params)
+     redirect_to event_path(@event), notice: 'Organiser was successfully updated.'
      else
        render: edit
      end
     end
  end

  def create
  end

  def destroy
  end

  private
  def set_role
    @user = current_user.id
  end

  def is_organiser?
    return true if current_user.is_organiser == true
  end

  def is_band?
    return true if current_user.is_band == true
  end

end
