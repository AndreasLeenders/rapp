class OrganisersController < ApplicationController

  before_action :set_organiser

  def new
    @organiser = Organiser.new
  end

  def create
    @organiser = Organiser.new(organiser_params)

    if @organiser.save
      redirect_to organiser_path(@organiser),  notice: 'Organiser was successfully created.'
    else
      render :new
    end
  end

  def edit

  end

  def update
    @organiser.update(organiser_params)
    #   redirect_to organiser_path(@organiser), notice: 'Organiser was successfully updated.'
    # else
    #   render :edit
    # end
  end

  def show

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
end
