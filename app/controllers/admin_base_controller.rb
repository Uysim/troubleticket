class AdminBaseController < ApplicationController
  include Pundit
  before_action :authenticate_user!
end
