class BandsController < ApplicationController
   before_action :set_band, only: [:show, :destroy]
 
  def index 
   @bands = Band.all

  end

  def show
   @band = Band.find(params[:id].to_i)

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
   raise 
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
  end

 private

  def set_band
    @band = Band.find(params[:id].to_i)
  end

  def band_params
    params.require(:band).permit(:name, :location)
  end

  def is_band?
    return true if current_band.is_band == true
  end
end