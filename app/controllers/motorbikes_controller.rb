class MotorbikesController < ApplicationController
  before_action :set_motorbike, only: [:show, :edit, :update, :destroy]

  def index
    #Get all the bikes geocoded
    @motorbikes = policy_scope(Motorbike).geocoded

    if params[:query].present?
        @motorbikes = @motorbikes.search_by_make_and_model_and_address(params[:query])
    end



    @markers = @motorbikes.map do |motorbike|
      {
        lat: motorbike.latitude,
        lng: motorbike.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { motorbike: motorbike }),
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
