class UsersController < AdminBaseController
  before_action :find_user, :authorize_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = UsersGrid.new(params[:users_grid])
    authorize @users.assets
  end

  def new
    @user = User.new
    authorize_user
  end

  def create
    @user = User.new(user_params)
    authorize_user
    if @user.save
      redirect_to users_path, notice: 'User is successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update_without_password(user_params)
      redirect_to users_path, notice: 'User is successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'User is successfully deleted'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :role, :password, :password_confirmation)
  end

  def authorize_user
    authorize @user
  end

  def find_user
    @user = User.find params[:id]
  end
end
