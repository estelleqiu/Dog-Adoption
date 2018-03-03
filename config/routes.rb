Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'adoption#index'

  concern :slug do
    get ':slug' => :show, on: :collection
  end

  resources :animals, only: [:show], concerns: :slug
end
