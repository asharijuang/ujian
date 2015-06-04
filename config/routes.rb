Rails.application.routes.draw do
  resources :questions
  resources :exams

  mount API => '/' 
end
