Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  #get "/sign_up" => "clearance/users#new", as: "sign_up"
  
  constraints Clearance::Constraints::SignedIn.new do 
    root to: 'dashboards#show'
  end
  root to: "static_pages#home"

  get 'about' => 'static_pages#about', as: 'about'
  get 'email_confirmation' => 'static_pages#email_confirmation'
  
  post 'generate_api_key' => 'users#generate_api_key'

  get 'resend_email_confirmation_form' => 'users#resend_email_confirmation_form'
  post 'resend_email_confirmation' => 'users#resend_email_confirmation'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, only: [:create, :show] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_up" => "users#new", as: "sign_up"

  get "/confirm_email/:token" => "email_confirmations#update", as: "confirm_email"

  namespace :api do
    namespace :v1 do
      resources :messages
    end
  end

end
