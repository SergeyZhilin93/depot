Depot::Application.routes.draw do

  get 'admin' => 'admin#index'

  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy

  end

  get 'sessions/create'
  get 'sessions/destroy'

  resources :users

  # resources :products do
  #   get :who_bought, on: :member
  # end

  concern :reviewable do
    resources :reviews
  end

  resources :products, shallow: true do
    resources :reviews
  end

  resources :users, concern: :reviewable

  scope '(:locale)' do
  resources :orders
  resources :line_items
  resources :carts
  root 'store#index', as: 'store', via: :all
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
