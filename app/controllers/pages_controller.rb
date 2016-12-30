class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashborad]
  def home
  end

  def dashborad
    @user_role = current_user.role
    if @user_role == 'admin'
      @troubles = Trouble.all
    else
      @troubles = Trouble.where(user_id: current_user.id)
      binding.pry
    end
  end
end
