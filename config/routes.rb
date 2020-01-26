Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'index#index' #controller name & action 
  post 'loginsuccess'=> 'login#login', as: "login"
  post 'menu' => "menu#menu"
  get 'loginsuccess/address' => 'address#address', as: "address"
  get 'loginsuccess/blockchain' => 'blockchain#blockchain', as: "blockchain"
  get 'loginsuccess/network' => 'network#network', as: "network"
  get 'loginsuccess/wallet' => 'wallet#wallet', as: "wallet"
  get 'loginsuccess/address/addressbalance' => 'address#addressbalance', as: "addressbalance"
  get 'loginsucess/address/snapshotwallet' => 'address#snapshotwallet', as: "snapshotwallet"
end