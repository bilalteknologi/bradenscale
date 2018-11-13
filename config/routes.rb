Rails.application.routes.draw do
  
  resources :decisions

  resources :transactions, only: [:create,:new,:destroy,:show,:index] do
    member do
      get :export_pdf, :as => 'export_pdf'
    end
  end
  # resources :questions
  # resources :answers
  devise_for :users, :skip => [:registrations, :recoverable]
  scope "/admin" do
    resources :users
  end
  devise_scope :user do
    get "/login" => "devise/sessions#new", :as => :new_user_session_path
    post "/login" => "devise/sessions#create", :as => :user_session_path
    delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session_path
  end

  root to: "transactions#index"

  resources :questions do
    resources :answers, only: [:create, :destroy, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
