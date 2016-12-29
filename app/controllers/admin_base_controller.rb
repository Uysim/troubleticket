class AdminBaseController < ApplicationController
  include Pundit
  before_action :authenticate_user!
  before_action :authorize_user

  private

  def authorize_user
    authorize controller_name.singularize.to_sym
  end
end
