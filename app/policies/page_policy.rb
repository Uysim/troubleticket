class PagePolicy < ApplicationPolicy
  def home?
    true
  end

  def dashboard?
    user.admin? || user.support?
  end
end
