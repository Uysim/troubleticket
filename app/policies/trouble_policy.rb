class TroublePolicy < ApplicationPolicy
  def assign?
    user.admin? && record.open?
  end
end
