class PagesController < ApplicationController
  def home
    @event = Event.new
  end
end
