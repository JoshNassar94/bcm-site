Rails.application.routes.draw do

  root 'welcome#index'

  get 'new_here', to: 'new_here#index'

  get 'get_involved/weekly_gatherings'
  get 'get_involved/small_groups'
  get 'get_involved/local_churches'
  get 'get_involved/show_staff_image'
  get 'get_involved/show_small_group_image'
  get 'get_involved/show_event_image'
  post 'get_involved/add_resource'
  delete 'get_involved/destroy_resource'
  post 'get_involved/add_bistro_menu'
  delete 'get_involved/destroy_menu'

  get 'resources/helpful_links'
  get 'resources/bistro_menu'

  get 'about_us/our_team'
  get 'about_us/our_mission'
  get 'about_us/contact'
  post '/about_us/sendEmail'

  post 'admin/attempt_login'
  get 'admin/login'
  get 'admin/logout'
  get 'admin/manage'
  get 'admin/admin_users'

  get 'admin/small_groups'
  post 'admin/add_small_group'
  get 'admin/edit_small_group'
  patch 'admin/update_small_group'
  delete 'admin/destroy_small_group'

  get 'admin/events'
  post 'admin/add_event'
  get 'admin/edit_event'
  patch 'admin/update_event'
  delete 'admin/destroy_event'

  get 'admin/staff'
  post 'admin/add_staff'
  get 'admin/edit_staff'
  patch 'admin/update_staff'
  delete 'admin/destroy_staff'

  get 'admin/churches'
  post 'admin/add_church'
  get 'admin/edit_church'
  patch 'admin/update_church'
  delete 'admin/destroy_church'

  get 'admin/user'
  post 'admin/add_user'
  get 'admin/edit_user'
  patch 'admin/update_user'
  delete 'admin/destroy_user'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
