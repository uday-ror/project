Rails.application.routes.draw do

  
  devise_for :users
    # namespace:'admin' do 
    #   resources :coffees
    # end
  namespace :admin do
    root "coffees#index"
    resources :coffees
    mount Ckeditor::Engine => '/ckeditor'
    get '/search' => 'coffees#search' 
  end
  root "dashboard#index"
  get '/search' => 'dashboard#search'
  resources :coffees, :only => [:index, :show]  do
  end  
  resources :payments
  resources :orders do
  resources :reviews
  end
  get 'thanks', to: 'orders#thanks'
  post "coffees/add_to_card/:id", to: "coffees#add_user_card", as: "add_user_card"
  delete "coffees/remove_from_cart/:id", to: "coffees#remove_user_card", as: "remove_user_card"
  get 'show_all_carts', to: 'dashboard#show_all_carts'
end 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
