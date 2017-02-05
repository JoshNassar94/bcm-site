Rails.application.routes.draw do

  root 'welcome#index'

  get 'welcome/test'
  post 'admin/attempt_login'
  get 'admin/login'
  get 'admin/logout'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
