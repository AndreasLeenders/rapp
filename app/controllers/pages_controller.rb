class PagesController < ApplicationController

  skip_before_action :authenticate_user!

  def home
    @event = Event.new
  end
end
