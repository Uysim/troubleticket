class TroublePolicy < ApplicationPolicy
  def index?
    user.admin? || user.support?
  end

  def create?
    true
  end

  def show?
    user.admin? || record.user == user
  end

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
