Rails.application.routes.draw do
  resources :answers
  resources :questions
  resources :exams

  mount API => '/' 
end
