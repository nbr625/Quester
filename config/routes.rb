Rails.application.routes.draw do
  resources :quest_logs do
    resources :quests do
      member do
        patch :complete
      end
    end
  end


  root "quest_logs#index"
end
