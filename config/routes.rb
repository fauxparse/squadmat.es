Rails.application.routes.draw do
  devise_for :users

  resources :squads do
    resources :members
  end

  root to: 'squads#index'
end
