Rails.application.routes.draw do

  resources :teams

  resources :clubs
  resources :games
  devise_for :players

  devise_for :coaches
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    # => ADDITIONNAL GAMES ROUTES
    get '/mygames',            to: 'games#mygames'
end
