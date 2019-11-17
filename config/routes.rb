Rails.application.routes.draw do

  match("/cuisines", { :controller => "application", :action => "return_cuisine_array", :via => "get"})

  match("/dishes", { :controller => "application", :action => "return_dish_array", :via => "get"})

  match("/dishes/:dish_id", { :controller => "application", :action => "return_dish", :via => "get"})

  match("/neighborhoods", { :controller => "application", :action => "return_neighborhood_array", :via => "get"})

  match("/venues", { :controller => "application", :action => "return_venue_array", :via => "get"})

  match("/users", { :controller => "application", :action => "return_user_array", :via => "get"})

  match("/users/:user_id", { :controller => "application", :action => "return_user", :via => "get"})

  match("/add_bookmark", { :controller => "application", :action => "add_bookmark", :via => "get"})

  match("/users/:user_id/bookmarks", { :controller => "application", :action => "return_user_bookmarks", :via => "get"})

  match("/venues/:venue_id/bookmarks", { :controller => "application", :action => "return_venue_bookmarks", :via => "get"})

  match("/remove_bookmark/:bookmark_id", { :controller => "application", :action => "remove_bookmark", :via => "get"})

  match("/users/:user_id/bookmarked_dishes", { :controller => "application", :action => "return_user_bookmarked_dishes", :via => "get"})

  match("/dishes/:dish_id/experts", { :controller => "application", :action => "return_dish_experts", :via => "get"})
  
  match("/venues/:venue_id/specialties", { :controller => "application", :action => "return_venue_specialties", :via => "get"})
  
  match("/venues/:venue_id/fans", { :controller => "application", :action => "return_venue_fans", :via => "get"})

  # ====================================================
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
