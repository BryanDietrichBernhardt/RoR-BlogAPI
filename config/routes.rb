Rails.application.routes.draw do
  resources :users

  root("posts#index")

  get("/posts", to: "posts#index")
  post("/posts", to: "posts#create")
  get("/posts/:id", to: "posts#show")
  patch("/posts/:id", to: "posts#update")
  put("/posts/:id", to: "posts#update")
  delete("/posts/:id", to: "posts#destroy")


end
