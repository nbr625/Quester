class QuestLogsController < ApplicationController
  before_action :set_quest_log, only: [:show, :edit, :update, :destroy]

  # GET /quest_logs
  # GET /quest_logs.json
  def index
    @quest_logs = QuestLog.all
  end

  # GET /quest_logs/1
  # GET /quest_logs/1.json
  def show
  end

  # GET /quest_logs/new
  def new
    @quest_log = QuestLog.new
  end

  # GET /quest_logs/1/edit
  def edit
  end

  # POST /quest_logs
  # POST /quest_logs.json
  def create
    @quest_log = QuestLog.new(quest_log_params)

    respond_to do |format|
      if @quest_log.save
        format.html { redirect_to @quest_log, notice: 'Quest log was successfully created.' }
        format.json { render :show, status: :created, location: @quest_log }
      else
        format.html { render :new }
        format.json { render json: @quest_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quest_logs/1
  # PATCH/PUT /quest_logs/1.json
  def update
    respond_to do |format|
      if @quest_log.update(quest_log_params)
        format.html { redirect_to @quest_log, notice: 'Quest log was successfully updated.' }
        format.json { render :show, status: :ok, location: @quest_log }
      else
        format.html { render :edit }
        format.json { render json: @quest_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quest_logs/1
  # DELETE /quest_logs/1.json
  def destroy
    @quest_log.destroy
    respond_to do |format|
      format.html { redirect_to quest_logs_url, notice: 'Quest log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quest_log
      @quest_log = QuestLog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quest_log_params
      params.require(:quest_log).permit(:title, :description)
    end
end
