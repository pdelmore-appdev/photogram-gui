Rails.application.routes.draw do


get("/", { :controller => "application", :action => "homepage" })
  get("/users", { :controller => "users", :action => "index" })
  get("/photos", { :controller => "photos", :action => "index" })
  get("/add_photo", { :controller => "photos", :action => "create" })
  get("/add_user", {:controller => "users", :action => "add_user" })

  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_photo_id", { :controller => "photos", :action => "delete_photo" })
  get("/update_photo/:update_photo_id", { :controller => "photos", :action => "update_photo"})

end
