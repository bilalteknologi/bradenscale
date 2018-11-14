class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :destroy, :export_pdf]

  # GET /transactions
  # GET /transactions.json
  def index
    if current_user.admin?
      @transactions = Transaction.all.paginate(:page => params[:page], :per_page => 2)
    else
      @transactions = Transaction.where(user_id: current_user.id).paginate(:page => params[:page], :per_page => 2)
    end
    authorize @transactions

  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
    @subtransactions = Subtransaction.where(transaction_id: params[:id])

    @decision = Decision.where(["begin_value <= ?",@transaction.score]).where(["end_value >= ?", @transaction.score]).first
    authorize @transaction


  end

  def export_pdf
    
    @subtransactions = Subtransaction.where(transaction_id: params[:id])

    @decision = Decision.where(["begin_value <= ?",@transaction.score]).where(["end_value >= ?", @transaction.score]).first
    
    respond_to do |format|
      format.pdf do
        render pdf: "tes",
        template: "transactions/export_pdf.html.erb",
        layout: 'layouts/pdf.html',
        locals: { transaction: @transaction, subtransaction: @subtransaction, decision: @decision }
      end
    end
  end

  # GET /transactions/new
  def new
    authorize @transaction

    @transaction = Transaction.new
    @questions = Question.all
    authorize @transaction

  end

  # GET /transactions/1/edit
  def edit
    authorize @transaction
  end

  # POST /transactions
  # POST /transactions.json
  def create
    # @transaction = Transaction.new(transaction_params)
    @answer = Answer.where(id: params[:answer_id])
    @transaction = Transaction.new(custom_transaction_params)
    @transaction.score = @answer.sum(:value)
    @transaction.user_id = current_user.id
    @transaction.gender = params[:gender][:gender]

    respond_to do |format|
      if @transaction.save
        params[:answer_id].each do |answer|
          @answerfind = Answer.find(answer)
          @subtransaction= Subtransaction.new
          @subtransaction.answer = @answerfind
          @subtransaction.tran = @transaction
          @subtransaction.save
        end
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    authorize @transaction

    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:name, :age, :checkin_date, :gender, :ruangan, :doctor, :medic_record_number, :bed_number, :score)
    end

    def custom_transaction_params

      params.require(:transaction).permit(:name, :age, :checkin_date, :ruangan, :doctor, :medic_record_number, :bed_number)
    end
end
