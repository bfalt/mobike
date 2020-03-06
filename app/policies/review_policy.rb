class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.booking.end_date > Date.today && user == record.booking.user && record.booking.review.id.nil?
    # Make sure to change the > to < so it actually make sense! You used this to show a review!
  end
end
