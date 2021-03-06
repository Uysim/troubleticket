class TroublesController < ApplicationController
  before_action :authenticate_user!, except: [:new, :create, :respond_client]
  before_action :find_client, only: [:create]
  before_action :set_trouble, only: [:show, :destroy, :assign, :work, :close, :respond_client]
  before_action :authorize_user, only: [:show, :destroy, :assign, :work, :close]

  # GET /troubles
  # GET /troubles.json
  def index
    @troubles = TroublesGrid.new(params[:troubles_grid]) do |scope|
      policy_scope(scope)
    end
    authorize @troubles.assets
  end

  # GET /troubles/1
  # GET /troubles/1.json
  def show
  end

  # GET /troubles/new
  def new
    @trouble = Trouble.new
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @trouble = Trouble.new(trouble_params.merge(client: @client))
    if @trouble.save
      redirect_to respond_client_trouble_path(@trouble), notice: ' Thanks you for report we will look into that trouble soon'
    else
      render :new
    end
  end

  def respond_client
  end

  # DELETE /troubles/1
  # DELETE /troubles/1.json
  def destroy
    @trouble.destroy
    redirect_to troubles_url, notice: 'Trouble was successfully destroyed.'
  end

  def assign
    @trouble.assign_attributes(assign_params)
    if @trouble.assign!
      redirect_to @trouble, notice: 'Trouble is already assigned support'
    else
      redirect_to @trouble, notice: @trouble.errors.full_messages.join(', ')
    end
  end

  def work
    if @trouble.work!
      redirect_to @trouble, notice: 'You are working on this trouble'
    else
      redirect_to @trouble, notice: @trouble.errors.full_messages.join(', ')
    end
  end

  def close
    if @trouble.close!
      redirect_to @trouble, notice: 'Trouble is already closed'
    else
      redirect_to @trouble, notice: @trouble.errors.full_messages.join(', ')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble
      id = params[:id] || params[:trouble_id]
      @trouble = Trouble.find(id)
    end

    def authorize_user
      authorize @trouble
    end

    def find_client
      @client = Client.find_by id_number: trouble_params[:client_id_number]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_params
      params.require(:trouble).permit(:range, :detail, :client_id_number, :occur_date)
    end

    def assign_params
      params.require(:trouble).permit(:user_id, :occupancy)
    end
end
