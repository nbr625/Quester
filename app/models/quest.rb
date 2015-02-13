class Quest < ActiveRecord::Base
  belongs_to :quest_log

  def completed?
  	!completed_at.blank?
  end
end
