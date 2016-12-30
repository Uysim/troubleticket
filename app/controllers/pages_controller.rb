class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashborad]
  def home
  end

  def dashborad
    @user_role = current_user.role
    @troubles = policy_scope(Trouble)
  end
end
