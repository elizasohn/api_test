Rails.application.routes.draw do
    resources :reviews
    #register
    # get '/register',  to: 'users#new',         as: 'new_user'
    post '/users',    to: 'users#create'

end
