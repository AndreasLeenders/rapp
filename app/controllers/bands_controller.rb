class BandsController < ApplicationController

  before_action :set_band, only: [:show, :destroy, :edit, :update]
  skip_before_action :authenticate_user!, only: [:index, :search, :show]

  def index
   @bands = Band.where.not(latitude: nil, longitude: nil)
   @markers = @bands.map do |band|
      {
        lat: band.latitude,
        lng: band.longitude#,
        # infoWindow: { content: render_to_string(partial: "/events/map_box", locals: { event: event }) }
      }
    end
  end

  def show
   @band = Band.find(params[:id].to_i)
   @markers = [
        {
          lat: @band.latitude,
          lng: @band.longitude#,
          # infoWindow: { content: render_to_string(partial: "/events/map_box", locals: { event: event }) }
        } ]
  end

  def new
   @band = Band.new
  end

  def edit
   if !is_band?
    puts "you are not allowed to access"
    redirect_to bands_path
    end
  end

  def create
   @band = Band.new(band_params)
   @band.user = current_user
   if @band.save
    redirect_to bands_path(@band)
   else
    render :new
   end
  end

  def update
   if is_band?
    if @band.update(band_params)
     redirect_to band_path(@band), notice: 'Band was successfully updated.'
    else
      render :edit
    end
   end

  end

  def destroy
   @band.destroy
   redirect_to bands_path
  end

 private

  def set_band
    @band = Band.find(params[:id].to_i)
  end

  def band_params
    params.require(:band).permit(:name, :location, :content, :pictures, :soundcloud)
  end

  def is_band?
    return true if current_user.is_band == true
  end
end
