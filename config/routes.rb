Rails.application.routes.draw do
    get("/", {:controller => "users", :action => "index"})
    get("/users", {:controller => "users", :action => "index" })
    get("/users/:name", {:controller => "users", :action => "show"})
    get("/photos", {:controller => "photos", :action => "index"})
    get("/photos/:photo_id", {:controller => "photos",:action => "show"})
    get("/delete_photo/:photo_id", {:controller => "photos", :action => "toast"})
    get("/insert_photo_record", {:controller => "photos", :action => "create"})
  end
