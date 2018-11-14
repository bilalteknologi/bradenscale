class DecisionsController < ApplicationController
  before_action :set_decision, only: [:show, :edit, :update, :destroy]

  # GET /decisions
  # GET /decisions.json
  def index
    @decisions = Decision.all
    authorize @decisions

  end

  # GET /decisions/1
  # GET /decisions/1.json
  def show
  end

  # GET /decisions/new
  def new
    @decision = Decision.new
    authorize @decision

  end

  # GET /decisions/1/edit
  def edit
    authorize @decision
  end

  # POST /decisions
  # POST /decisions.json
  def create
    @decision = Decision.new(decision_params)
    authorize @decision
    respond_to do |format|
      if @decision.save
        format.html { redirect_to @decision, notice: 'Decision was successfully created.' }
        format.json { render :show, status: :created, location: @decision }
      else
        format.html { render :new }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /decisions/1
  # PATCH/PUT /decisions/1.json
  def update
    respond_to do |format|
      if @decision.update(decision_params)
        format.html { redirect_to @decision, notice: 'Decision was successfully updated.' }
        format.json { render :show, status: :ok, location: @decision }
      else
        format.html { render :edit }
        format.json { render json: @decision.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /decisions/1
  # DELETE /decisions/1.json
  def destroy
    authorize @decision
    @decision.destroy
    respond_to do |format|
      format.html { redirect_to decisions_url, notice: 'Decision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_decision
      @decision = Decision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def decision_params
      params.require(:decision).permit(:begin_value, :end_value, :decision, :title)
    end
end
