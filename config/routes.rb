Rails.application.routes.draw do

  root 'welcome#index'

  get 'new_here/index'

  get 'get_involved/upcoming-events'
  get 'get_involved/weekly-gatherings'
  get 'get_involved/small-groups'
  get 'get_involved/local-churches'

  get 'resources/newsletter'
  get 'resources/sermon-notes'
  get 'resources/testimonies'
  get 'resources/leadership-app'

  get 'about_us/our-team'
  get 'about_us/our-mission'
  get 'about_us/faqs'
  get 'about_us/social-media'


  post 'admin/attempt_login'
  get 'admin/login'
  get 'admin/logout'
  get 'admin/manage'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
