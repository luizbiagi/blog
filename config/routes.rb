ActionController::Routing::Routes.draw do |map|
  map.resources :templates

  map.resources :comments

  map.resources :category_posts

  map.resources :categories

  map.resources :posts

  map.resources :blog_users

  map.resources :blogs

  map.root                  :controller =>     'home', :action => 'index'
  map.home              '', :controller =>     'home', :action => 'index'
  map.logout     '/logout', :controller => 'sessions', :action => 'destroy'
  map.login       '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller =>    'users', :action => 'create'
  map.signup     '/signup', :controller =>    'users', :action => 'new'
  map.resources :users
  map.resource :session

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
