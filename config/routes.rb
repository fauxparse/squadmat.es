Rails.application.routes.draw do
  resources :squads do
    resources :members
  end
end
