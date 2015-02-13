class QuestLogsController < ApplicationController
  before_action :set_quest_log, only: [:show, :edit, :update, :destroy]

  def index
    @quest_logs = QuestLog.all
  end

  def show
  end
  
  def new
    @quest_log = QuestLog.new
  end
  
  def edit
  end
 
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
 
  def destroy
    @quest_log.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Quest log was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_quest_log
      @quest_log = QuestLog.find(params[:id])
    end

    
    def quest_log_params
      params.require(:quest_log).permit(:title, :description)
    end
end
