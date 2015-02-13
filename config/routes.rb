Rails.application.routes.draw do
  resources :quest_logs do
    resources :quests
  end


  root "quest_logs#index"
end
