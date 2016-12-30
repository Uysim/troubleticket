class TroublePolicy < ApplicationPolicy
  def assign?
    user.admin? && record.open?
  end

  def work?
    record.user == user && record.assigned?
  end

  def close?
    record.user == user && record.working?
  end
end
