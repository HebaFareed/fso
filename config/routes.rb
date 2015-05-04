Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :jobs do
      post :create_follower
      get :delete_follower
      get :block_follower
      get :follower
  end

  get 'home/index'
  get 'home/women_jobs'
  get 'home/men_jobs'
  get 'home/women_applicants'
  get 'home/men_applicants'
  get 'home/fresh_graduate_jobs'
  get 'home/fresh_graduate_applicants'
  get 'home/experienced'
  get 'home/internship'

  devise_for :applicants, :controllers => {:registrations => "applicants/registrations", :sessions => "applicants/sessions"}
  devise_for :employers, :controllers => {:registrations => "employers/registrations", :sessions => "employers/sessions"}
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  resources :courses do
    post :create_follower
    get :delete_follower
    get :block_follower
  end

  root "home#index"
   resources :applicants do
   member do
      get :profile
      get :show
      get :following
    end
   end

   resources :employers  do
   member do
      get :show
      get :job
      get :internship

    end
   end

resources :payments, only: [:new, :create]

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
