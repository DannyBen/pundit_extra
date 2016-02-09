Rails.application.routes.draw do
  root 'tasks#index'
  get 'tasks'              => 'tasks#index'
  get 'tasks/:id'          => 'tasks#show'
  get 'tasks/:id/complete' => 'tasks#complete'
  get 'tasks/purge'        => 'tasks#purge'
  get 'tasks/whoami'       => 'tasks#whoami'
end
