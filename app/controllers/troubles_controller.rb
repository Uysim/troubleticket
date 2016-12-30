class TroublesController < AdminBaseController
  before_action :set_trouble, :authorize_user, only: [:show, :destroy, :assign, :work, :close]


  # GET /troubles
  # GET /troubles.json
  def index
    @troubles = TroublesGrid.new(params[:troubles_grid])
    authorize @troubles.assets
  end

  # GET /troubles/1
  # GET /troubles/1.json
  def show
  end

  # GET /troubles/new
  def new
    @trouble = Trouble.new
    authorize_user
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @trouble = Trouble.new(trouble_params)
    authorize_user
    respond_to do |format|
      if @trouble.save
        format.html { redirect_to @trouble, notice: 'Trouble was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # DELETE /troubles/1
  # DELETE /troubles/1.json
  def destroy
    @trouble.destroy
    respond_to do |format|
      format.html { redirect_to troubles_url, notice: 'Trouble was successfully destroyed.' }
    end
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_params
      params.require(:trouble).permit(:client_id, :range, :detail)
    end

    def assign_params
      params.require(:trouble).permit(:user_id, :occupancy)
    end
end
