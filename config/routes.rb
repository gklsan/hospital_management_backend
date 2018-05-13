Rails.application.routes.draw do
  resources :appointments
  namespace :api do

    resources :patients

    resources :doctors

    resources :appointments

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: "patients#index"
end
