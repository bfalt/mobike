class ReviewsController < ApplicationController
  before_action :set_booking, only: [ :index, :new, :create ]
  skip_after_action :verify_policy_scoped, only: :index
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    authorize @review
    @review.user = current_user
    @review.booking = Booking.find(params[:booking_id])
    @review.save
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end
end
