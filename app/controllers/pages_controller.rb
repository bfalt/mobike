class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
  end

  def dashboard
    @motorbikes = current_user.motorbikes
    @bookings = current_user.bookings
  end
end

