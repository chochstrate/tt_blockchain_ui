Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'index#index' #controller name & action 
  post 'loginsuccess'=> 'login#login', as: "login"
end