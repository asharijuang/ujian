Rails.application.routes.draw do
  root 'home#index'

  resources :exams do
  	resources :questions do
  		resources :answers
  	end
  end

  mount API => '/' 
end
