Rails.application.routes.draw do
  
  resources :questions
  resources :answers
  devise_for :users, :skip => [:registrations, :recoverable]
  devise_scope :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session_path
    root to: "devise/sessions#new"
    post "/login" => "devise/sessions#create", :as => :user_session_path
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session_path
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
