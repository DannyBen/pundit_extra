Rails.application.routes.draw do
  root 'tasks#index'

  get 'tasks'            => 'tasks#index'
  get 'tasks/new'        => 'tasks#new'
  get 'tasks/create'     => 'tasks#create'
  get 'tasks/:id/update' => 'tasks#update'
  get 'tasks/purge'      => 'tasks#purge'
  get 'tasks/:id'        => 'tasks#show'

  get 'books'            => 'books#index'
  get 'books/:id/update' => 'books#update'
  get 'books/create'     => 'books#create'
  get 'books/:id'        => 'books#show'

  get 'status' => 'tasks#status'
  get 'whoami' => 'tasks#whoami'
end
