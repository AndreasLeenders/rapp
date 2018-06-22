class OrganisersController < ApplicationController

  before_action :set_organiser

  def new
    @organiser = Organiser.new
  end

  def create
    @organiser = Organiser.new(organiser_params)
    if @organiser.save
      redirect_to new_organiser_path(@organiser),  notice: 'Organiser was successfully created.'
    else
      render :new
    end
  end

  def edit
    if is_band?
    puts "you are not allowed to access"
    redirect_to organisers_path
    end
  end

  def update
   # if !is_band?
    if @organiser.update(organiser_params)
     redirect_to organiser_path(@organiser), notice: 'organiser was successfully updated.'
    else
       render :edit
       redirect_to edit_organiser_path
     end
    # end
  end

  def show
    @organiser = Organiser.find(params[:id])
  end

  def index
    @organiser = Organiser.all
  end

  def destroy
    @organiser.destroy
  end

  private

  def organiser_params
    params.require(:organiser).permit(:name)
  end

  def set_organiser
    @organiser = Organiser.find(params[:id])
  end

  def is_band?
    return true if current_user.is_band == true
  end
end
