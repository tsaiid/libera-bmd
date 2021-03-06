BoneDensityAnalyzer::Application.routes.draw do
  # You can have the root of your site routed with "root"
  # You should put the root route at the top of the file, because it is the most popular route and should be matched first.
  root 'studies#index'

  get "statistics/pcu_average"
  get "statistics/pcu_spine/:sex" => 'statistics#pcu_spine', as: 'statistics_pcu_spine'
  get "statistics/spine/:level/:sex/:age/:interval" => 'statistics#spine'
  get "statistics/spine/:level/:sex/:age/:interval/round/:round_num" => 'statistics#spine'

  get "studies/index"
  get "studies/index/page/:page" => 'studies#index'
  get "studies/:accession_no" => 'studies#show', as: 'study_show'
  get "studies/report/:accession_no" => 'studies#report'
  get "studies/report/:accession_no/:mode" => 'studies#report'
  get "studies/pagination/:accession_no" => 'studies#pagination'

  get "patients/index"
  get "patients/index/page/:page" => 'patients#index'
  get "patients/:pid" => 'patients#show', as: 'patient_show'
  get "patients/key/:patient_key" => 'patients#key', as: 'patient_key'
  get "patients/pagination/:pid" => 'patients#pagination'
  get "patients/pagination/key/:patient_key" => 'patients#pagination_key'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
