Rails.application.routes.draw do
  resources :doctors
  resources :hospitals do
      post 'remove_doctor', on: :member
  end    

  root 'hospitals#index'


end
