class TroublesController < ApplicationController
  before_action :set_trouble, only: [:show, :edit, :update, :destroy]

  # GET /troubles
  # GET /troubles.json
  def index
    @troubles = Trouble.all
  end

  # GET /troubles/1
  # GET /troubles/1.json
  def show
  end

  # GET /troubles/new
  def new
    @trouble = Trouble.new
  end

  # GET /troubles/1/edit
  def edit
  end

  # POST /troubles
  # POST /troubles.json
  def create
    @trouble = Trouble.new(trouble_params)

    respond_to do |format|
      if @trouble.save
        format.html { redirect_to @trouble, notice: 'Trouble was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /troubles/1
  # PATCH/PUT /troubles/1.json
  def update
    respond_to do |format|
      if @trouble.update(trouble_params)
        format.html { redirect_to @trouble, notice: 'Trouble was successfully updated.' }
      else
        format.html { render :edit }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trouble
      @trouble = Trouble.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trouble_params
      params.require(:trouble).permit(:client_id, :user_id, :range, :state, :detail)
    end
end
