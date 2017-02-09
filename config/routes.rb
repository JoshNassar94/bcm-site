Rails.application.routes.draw do

  root 'welcome#index'

  get 'new_here/index'

  get 'get_involved/upcoming_events'
  get 'get_involved/weekly_gatherings'
  get 'get_involved/small_groups'
  get 'get_involved/local_churches'
  get 'get_involved/show_image'

  get 'resources/newsletter'
  get 'resources/sermon_notes'
  get 'resources/testimonies'
  get 'resources/leadership_app'

  get 'about_us/our_team'
  get 'about_us/our_mission'
  get 'about_us/faqs'
  get 'about_us/social_media'


  post 'admin/attempt_login'
  get 'admin/login'
  get 'admin/logout'
  get 'admin/manage'
  get 'admin/small_groups'
  post 'admin/add_small_group'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
