class BandsController < ApplicationController
   before_action :set_band, only: [:index, :show, :create, :destroy]
 
 def index 
  @bands = Band.all
 end

 def show
 end

 def new
  @band = Band.new
 end

 def edit
 end
 
 def create
  @band = Band.new(band_params)
  if @band.save
    redirect_to band_path(@band)
  else
    render :new
  end
 end

 def update
  if @band.update(band_params)
     redirect_to band_path(@band)
  else
     render :edit
  end
 end

 def destroy
  @band = Band.find(params[:id])
  @band.destroy
  redirect_to band_path(@band)
 end


 private

 def set_band
    @band = Band.find(params[:id])
 end

 def band_params
    params.require(:band).permit(:name)
 end

end
