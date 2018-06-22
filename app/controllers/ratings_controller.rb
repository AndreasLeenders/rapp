class RatingsController < ApplicationController

  def new
    @band = Band.find(params[:id])
    @event = Event.find(params[:id])
    @rating = Rating.new
  end

  def create
    @band = Band.find(params[:id])
    @event = Event.find(params[:id])
    @rating = Rating.new
    @rating.event = @event
     if @rating.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @rating = Rating.find(params[:id])
    @rating.destroy
    redirect_to root_path
  end

  private

  def rating_params
    params.require(:rating).permit(:content)
  end
end



