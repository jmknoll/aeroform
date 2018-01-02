Rails.application.routes.draw do
  constraints Clearance::Constraints::SignedIn.new do 
    root to: 'dashboards#show'
  end
  root to: "static_pages#home"

  get 'about' => 'static_pages#about', as: 'about'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end


  get "/sign_up" => "users#new", as: "sign_up"
  get "/sign_in" => "sessions#new", as: "sign_in"
  delete "/sign_out" => "sessions#destroy", as: "sign_out"
end
