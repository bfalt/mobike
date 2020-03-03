class MotorbikesController < ApplicationController
  before_action :set_motorbike, only: [:show, :edit, :update, :destroy]

  def index
    @motorbikes = policy_scope(Motorbike)
  end

  def show
    authorize @motorbike
  end

  def new
    @motorbike = Motorbike.new
    authorize @motorbike
  end

  def create
    @motorbike = Motorbike.new(motorbike_params)
    @motorbike.user = current_user
    authorize @motorbike
    if @motorbike.save
      redirect_to motorbike_path(@motorbike), notice: 'Your bike was successfully created.'
    else
      render 'new'
    end
  end

  def edit
    authorize @motorbike
  end

  def update
    authorize @motorbike
    if @motorbike.update(motorbike_params)
      redirect_to @motorbike, notice: 'Your bike was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @motorbike
    @motorbike.destroy
    redirect_to motorbikes_url, notice: 'Your bike was successfully deleted.'
  end

  private

  def set_motorbike
    @motorbike = Motorbike.find(params[:id])
  end

  def motorbike_params
    params.require(:motorbike).permit(:name, :make, :model, :year, :description, :address)
  end
end
