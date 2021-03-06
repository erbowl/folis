Rails.application.routes.draw do
  get 'home/index'

  get :sign_in,to: 'users/sessions#new',as: :new_user_session
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  devise_scope :user do
    delete :sign_out,to: 'devise/sessions#destroy',as: :destroy_user_session
  end
  root 'home#index'
end
