Rails.application.routes.draw do
  devise_for :teacher_users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #devise_for :admin_users, controllers: { confirmations: 'confirmations' }
  
end
