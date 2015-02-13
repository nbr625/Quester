class QuestsController < ApplicationController
	before_action :set_quest_log
	before_action :set_quest, except: [:create]
	def create
		@quest = @quest_log.quests.create(quest_params)
		redirect_to quest_log_path(@quest_log)
	end
	def destroy
		@quest = @quest_log.quests.find(params[:id])
		if @quest.destroy
			flash[:sucess] = "Quest was abandoned"
		else
			flash[:error] = "Quest could not be abandoned"
		end
		redirect_to @quest_log
	end	
	def complete
		@quest.update_attribute(:completed_at, Time.now)
		redirect_to @quest_log, notice: "Quest Fulfilled"
	end

	private

	def set_quest_log
		@quest_log = QuestLog.find(params[:quest_log_id])
	end

	def set_quest
		@quest = @quest_log.quests.find(params[:id])
	end

	def quest_params
		params[:quest].permit(:content)
	end
end

