class MotorbikesController < ApplicationController
  before_action :set_motorbike, only: [:show, :edit, :update, :destroy]

  def index
    @motorbikes = policy_scope(Motorbike)
    @motorbikes = Motorbike.geocoded
    @markers = @motorbikes.map do |motorbike|
      {
        lat: motorbike.latitude,
        lng: motorbike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { motorbike: motorbike }),
        # image_url: helpers.asset_url('surflogo.png')
      }
    end
  end

  def show
    @booking = Booking.new
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
    params.require(:motorbike).permit(:name, :make, :model, :year, :description, :address, photos: [])
  end
end
