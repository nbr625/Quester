class QuestsController < ApplicationController
	before_action :set_quest_log
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

	private

	def set_quest_log
		@quest_log = QuestLog.find(params[:quest_log_id])
	end

	def quest_params
		params[:quest].permit(:content)
	end
end