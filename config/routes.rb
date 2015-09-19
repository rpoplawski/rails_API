Rails.application.routes.draw do

#resource :orders
  get '/orders',             to: 'orders#index'
  post '/orders',            to: 'orders#create'
  get  '/orders/new',        to: 'orders#new'
  get  '/orders/edit',       to: 'orders#edit'
  get  '/orders/:id',        to: 'orders#show'
 #patch 'orders/:id',        to: 'orders#update'
  put   '/orders/:id',       to: 'orders#update'
  delete '/orders/:id',      to: 'orders#destroy'

#resource :users
  get    '/users',          to: 'users#index'
  post   '/users',          to: 'users#create'
  get    '/users/new',      to: 'users#new'
  get    '/users/edit',     to: 'users#edit'
  get    '/users/:id',      to: 'users#show'
 #patch  '/users/:id',      to: 'users#update'
  put    '/users/:id',      to: 'users#update'
  delete '/users/:id',      to: 'users#destroy'

#resource :addresses
  get    '/addresses',      to: 'addresses#index'
  post   '/addresses',      to: 'addresses#create'
  get    '/addresses/new',  to: 'addresses#new'
  get    '/addresses/edit', to: 'addresses#edit'
  get    '/addresses/:id',  to: 'addresses#show'
 #patch  '/addresses/:id',  to: 'addresses#update'
  put    '/addresses/:id',  to: 'addresses#update'
  delete '/addresses/:id',  to: 'addresses#destroy'

#resource :items
   get    '/items',      to:   'items#index'
   post   '/items',      to:   'items#create'
   get    '/items/new',  to:   'items#new'
   get    '/items/edit', to:   'items#edit'
   get    '/items/:id',  to:   'items#show'
  #patch  '/items/:id',  to:   'items#update'
   put    '/items/:id',  to:   'items#update'
   delete '/items/:id',  to:   'items#destroy'
end

