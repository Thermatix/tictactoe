Rails.application.routes.draw do
  # resource :grid, except: [:edit,:new]
  post '/grid',to:'grids#create', as:'create_grid'
  get '/grid',to:'grids#show' , as: 'show_grid'
  put '/grid',to:'grids#update' , as: 'update_grid'
  delete '/grid', to:'grids#destroy' ,as: 'destroy_grid'
  root to: 'grids#index'
end
