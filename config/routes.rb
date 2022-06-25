Rails.application.routes.draw do
  #devise_for :admins
  #devise_for :members
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :members, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

 namespace :admin do
  root to: 'homes#top'
  resources :genres, only: [:index, :create, :edit, :update]
  resources :members, only: [:index, :show, :edit, :update]
 end

 scope module: :public do
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  resources :comments, only: [:index, :show, :new, :create]
  #resources :favorites, only: [:index, :create, :destroy, :update]
  resource :members, only: [:show, :edit, :update]
  get '/members/unsubscribe' => 'members#unsubscribe', as: 'unsubscribe'
  patch '/members/withdrawal' => 'members#withdrawal', as: 'withdrawal'
  resources :posts
 end

end
