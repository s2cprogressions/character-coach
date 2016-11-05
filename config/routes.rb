Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root 'home#index'

  resources :activities, only: :index

  get 'app_entry_point', to: 'home#app_entry_point'
  get 'challenges', to: 'home#challenges'
  get 'complete', to: 'home#complete'
  get 'concerns', to: 'home#concerns'
  get 'feelings', to: 'home#feelings'
  get 'let_me_help', to: 'home#let_me_help'
  get 'not_alone', to: 'home#not_alone'
  get 'positive_behaviors', to: 'home#positive_behaviors'
  get 'positive_emotions', to: 'home#positive_emotions'
  get 'positive_thoughts', to: 'home#positive_thoughts'
  get 'success_plan', to: 'home#success_plan'
  get 'summary', to: 'home#summary'
  get 'thanks', to: 'home#thanks'
  get 'thoughts', to: 'home#thoughts'
  get 'about', to: 'home#about'

end
