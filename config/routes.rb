Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "finals#index"
  # Routes for the Enrollment resource:

  # CREATE
  get("/enrollments/new", { :controller => "enrollments", :action => "new_form" })
  post("/create_enrollment", { :controller => "enrollments", :action => "create_row" })
  post("/create_enrollment_from_final", { :controller => "enrollments", :action => "create_row_from_final" })

  # READ
  get("/enrollments", { :controller => "enrollments", :action => "index" })
  get("/enrollments/:id_to_display", { :controller => "enrollments", :action => "show" })

  # UPDATE
  get("/enrollments/:prefill_with_id/edit", { :controller => "enrollments", :action => "edit_form" })
  post("/update_enrollment/:id_to_modify", { :controller => "enrollments", :action => "update_row" })

  # DELETE
  get("/delete_enrollment/:id_to_remove", { :controller => "enrollments", :action => "destroy_row" })
  get("/delete_enrollment_from_user/:id_to_remove", { :controller => "enrollments", :action => "destroy_row_from_user" })
  get("/delete_enrollment_from_final/:id_to_remove", { :controller => "enrollments", :action => "destroy_row_from_final" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # Routes for the Final resource:

  # CREATE
  get("/finals/new", { :controller => "finals", :action => "new_form" })
  post("/create_final", { :controller => "finals", :action => "create_row" })

  # READ
  get("/finals", { :controller => "finals", :action => "index" })
  get("/finals/:id_to_display", { :controller => "finals", :action => "show" })

  # UPDATE
  get("/finals/:prefill_with_id/edit", { :controller => "finals", :action => "edit_form" })
  post("/update_final/:id_to_modify", { :controller => "finals", :action => "update_row" })

  # DELETE
  get("/delete_final/:id_to_remove", { :controller => "finals", :action => "destroy_row" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
