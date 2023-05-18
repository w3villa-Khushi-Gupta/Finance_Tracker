Rails.application.routes.draw do
  get 'my_portfolio', to: 'users#my_portfolio'
  devise_for :users 
  root 'welcome#index'
  get 'search_stock', to: 'stocks#search'
end
