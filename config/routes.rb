Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root "home#index"

  resource :activity, only: :index do
    get :challenges
    get :not_alone
    get :thoughts
    get :feelings
    get :concerns
    get :thanks
    get :summary
    get :let_me_help
    get :positive_thoughts
    get :positive_emotions
    get :positive_behaviors
    get :success_plan
    get :complete
  end

  get "app_entry_point", to: "home#app_entry_point"
  get "/about", to: "home#about", as: :about
  get "/help", to: "home#help", as: :help
end
