json.array!(@quest_logs) do |quest_log|
  json.extract! quest_log, :id, :title, :description
  json.url quest_log_url(quest_log, format: :json)
end
