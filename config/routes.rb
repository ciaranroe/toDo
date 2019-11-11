Rails.application.routes.draw do
  
  resources :users
  get 'tasks/index'

  get 'tasks/new'

  root 'welcome#index'
  #get 'welcome/index'
  
  #for add, delete etc.. tasks we get it using this route
  resources:tasks
  
  # we want to connect a link with an action
  #so here, when we complete a task, we want 
  #to be routed to the completed action
  #so, basically, the link carries out the action
  get '/tasks/:id/complete/:Completed', to: 'tasks#complete'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
