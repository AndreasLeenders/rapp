class OrganisersController < ApplicationController

  before_action :set_user

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
    if @organiser.update(organiser_params)
      redirect_to organiser_path(@organiser), notice: 'Organiser was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @user = current_user.id

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

  def set_user
    @user = current_user.id
  end
end
