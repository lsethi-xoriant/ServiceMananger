Rails.application.routes.draw do
 namespace :api,defaults:{format: 'json'} do

   resources :users,except:[:new,:edit]
   resources :access,only:[:create,:destroy]
   resources :groups
   resources :permissions ,only:[:index]

 end
end
