Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'
  resources :enrollments
  resources :course_subjects
  resources :subjects
  resources :instructors
  resources :courses
  resources :searches
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/search', to: 'search#search'
  get '/search_results', to: 'search#search_results'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

end
