class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:dashborad]
  def home
  end

  def dashborad
    @troubles = policy_scope(Trouble)
  end
end
