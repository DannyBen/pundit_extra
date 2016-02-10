Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks'              => 'tasks#index'
  get 'tasks/new'          => 'tasks#new'
  get 'tasks/create'       => 'tasks#create'
  get 'tasks/:id'          => 'tasks#show'

  # get 'tasks/:id/complete' => 'tasks#complete'
  
  # get 'tasks/purge'        => 'tasks#purge'

  get 'whoami'             => 'tasks#whoami'
end
