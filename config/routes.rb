OkuribitoRails::Engine.routes.draw do
  resources :method_call_logs, only: [:index]
  resources :method_call_situations, only: [:index]

  root to: 'top#show'
end
