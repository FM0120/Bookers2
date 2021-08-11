Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'

    get '/users/logout' => 'devise/sessions#destroy'
    get '/home/about'=> 'homes#about'

    resources :users, only: [:new, :show, :edit, :update, :destroy,:index]
    resources :books, only: [:new, :create, :index, :show, :edit, :destroy,:update]

end