Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users do
    collection do
      get :new_with_address
      post :new_with_address, action: :create_with_address
    end

    member do
      get :edit_with_address
      patch :edit_with_address, action: :update_with_address
    end
  end

  resources :addresses do
    collection do
      get :new_with_user
      post :new_with_user, action: :create_with_user
    end

    member do
      get :edit_with_user
      patch :edit_with_user, action: :update_with_user
    end
  end

  root to: 'users#index'
end
