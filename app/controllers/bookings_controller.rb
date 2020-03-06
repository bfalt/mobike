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
  end

  def new
    year = params[:booking]["start_date(1i)"].to_i
    month = params[:booking]["start_date(2i)"].to_i
    day = params[:booking]["start_date(3i)"].to_i
    start_date = Date.new(year, month, day)
    year = params[:booking]["end_date(1i)"].to_i
    month = params[:booking]["end_date(2i)"].to_i
    day = params[:booking]["end_date(3i)"].to_i
    end_date = Date.new(year, month, day)
    @booking = Booking.new
    authorize @booking
    @booking.start_date = start_date
    @booking.end_date = end_date
    @motorbike = Motorbike.find(params[:motorbike_id])
    @booking.total_price = (@booking.end_date - @booking.start_date).to_i * @motorbike.price
  end

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

  def accept
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "accepted"
    @booking.save
    redirect_to pages_dashboard_path, notice: "Booking accepted"
  end

  def reject
    @booking = Booking.find(params[:booking_id])
    authorize @booking
    @booking.status = "rejected"
    @booking.save
    redirect_to pages_dashboard_path, notice: "Booking rejected"
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :user_approved)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_motorbike
    @motorbike = Motorbike.find(params[:motorbike_id])
  end
end
