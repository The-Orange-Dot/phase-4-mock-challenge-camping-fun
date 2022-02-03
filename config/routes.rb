Rails.application.routes.draw do
  resources :campers, only: [ :index, :create]
  resources :activities, only: [:index]
  resources :signups, only: [:create]

  delete "/activities/:id" => "activities#delete"
  get "/campers/:id" => "campers#show"

end
