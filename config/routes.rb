Rails.application.routes.draw do
  resources :questions do
  	resources :answers
  end
  resources :exams


  mount API => '/' 
end
