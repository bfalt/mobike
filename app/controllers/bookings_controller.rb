class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped, only: :index
  before_action :set_booking, only: [:show]
  before_action :set_motorbike, only: [:new, :create]

  def index
    @bookings = current_user.bookings
  end

  def show
    authorize @booking
    rails
  end

  # New booking form on show page of motorbike
  # def new
  #   @booking = Booking.new
  #   authorize @booking
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.motorbike = Motorbike.find(params[:motorbike_id])
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking), notice: 'Your booking was successfull!'
    else
      redirect_to motorbike_path(@motorbike)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end
end
