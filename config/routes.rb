Rails.application.routes.draw do



  get("/users", { :controller => "users", :action => "index" })

  get("/photos", { :controller => "photos", :action => "index" })


  get("/users/:path_username", { :controller => "users", :action => "show" })
  get("/photos/:path_photo_id", { :controller => "photos", :action => "show" })
  get("/delete_photo/:path_photo_id", { :controller => "photos", :action => "delete_photo" })

end
