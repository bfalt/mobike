class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def create?
    true
  end

   def accept?
    record.motorbike.user == user
  end

   def reject?
    record.motorbike.user == user
  end
end
