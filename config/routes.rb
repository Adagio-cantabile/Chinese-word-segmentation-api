Rails.application.routes.draw do
  resources :new_words
  resources :history_records
  resources :items
  resources :users do
    member do
      get :confirm_email
    end
  end
  post 'authenticate', to: 'authentication#authenticate'
  resources :users, only: [:index, :create, :show, :update, :destroy]

  post 'segmentation', to: 'word_segmentation#tag'
  post 'modify', to: 'word_segmentation#modify'
end
