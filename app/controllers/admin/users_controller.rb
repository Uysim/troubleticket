module Admin
  class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = UsersGrid.new(params[:users_grid])
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to admin_users_path, notice: 'User is successfully created.'
      else
        render :new
      end
    end

    def edit
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to admin_user_path(@user), notice: 'User is successfully updated'
      else
        render :edit
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User is successfully deleted'
    end

    private

    def user_params
      params.require(:user).permit(:email, :role, :password, :password_confirmation)
    end

    def find_user
      @user = User.find params[:id]
    end
  end
end
