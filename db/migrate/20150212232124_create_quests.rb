class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :content
      t.references :quest_log, index: true

      t.timestamps null: false
    end
    add_foreign_key :quests, :quest_logs
  end
end
