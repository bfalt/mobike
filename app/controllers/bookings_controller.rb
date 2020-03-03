class BookingsController < ApplicationController

  def show

  end

  def new
    @motorbike = Motorbike.find(params[:motorbike_id])
    @booking = Booking.new
  end

  def create
    @motorbike = Motorbike.find(params[:motorbike_id])
    @booking = Booking.new(booking_params)
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
end
