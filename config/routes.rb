Rails.application.routes.draw do

  root 'pages#home'

  devise_for :users, :path => '', 
             :path_names => {:sign_in => 'login', :sign_out => 'logout', :edit => 'profile'},
             :controllers => {:omniauth_callbacks => 'omniauth_callbacks',
                              :registrations => 'registrations'
                             }
  


  resources :seengames do 
    member do
      put "like", to: "seengames#upvote"
      put "dislike", to: "seengames#downvote"
    end
  end
  resources :seenplayers do 
    member do
      put "like", to: "seenplayers#upvote"
      put "dislike", to: "seenplayers#downvote"
    end
  end  
  resources :users, only: [:show]
  resources :courts
  resources :photos
  resources :userphotos
  resources :courts do
    resources :runs, only: [:create, :destroy]
  end
  resources :courts do
    resources :seengames, only: [:create]
  end
  resources :courts do
    resources :seenplayers, only: [:create]
  end
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
  resources :courts do
    resources :reviews
  end
  resources :suggestions, only: [:new, :create]

  get '/preload' => 'runs#preload'

  get '/search' => 'pages#search'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
