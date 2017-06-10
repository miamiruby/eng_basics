Rails.application.routes.draw do
  # http://guides.rubyonrails.org/routing.html
  resources :fibs
  root 'fibs#index'
end
