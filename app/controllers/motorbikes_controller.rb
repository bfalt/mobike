class MotorbikesController < ApplicationController
  def index
    @motorbikes = Motorbike.all
  end

  def show
    @motorbike = Motorbike.find(params[:id])
  end

  def new
    @motorbike = Motorbike.new
  end

  def create
    @motorbike = Motorbike.new(motorbike_params)
    if @motorbike.save
      redirect_to motorbike_path(@motorbike)
    else
      render 'new'
    end
  end

  def edit
    @motorbike = Motorbike.find(params[:id])
  end

  def update
    @motorbike = Motorbike.find(params[:id])
    @motorbike.update(motorbike_params)
    redirect_to @motorbike
  end

  def destroy
    @motorbike = Motorbike.find(params[:id])
    @motorbike.destroy
  end

  private

  def motorbike_params
    params.require(:motorbike).permit(:name, :make, :model, :year, :description, :address)
  end
end
