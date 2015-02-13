class AddCompletedAtToQuests < ActiveRecord::Migration
  def change
    add_column :quests, :completed_at, :datetime
  end
end
