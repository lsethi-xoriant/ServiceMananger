Rails.application.routes.draw do
 namespace :api,defaults:{format: 'json'} do

   resources :users,except:[:new,:edit]
   resources :access,only:[:create,:destroy]
   resources :groups,except:[:new,:edit]
   resources :permissions ,only:[:index]
   resources :companies,exept:[:new,:edit]
   resources :stores,exept:[:new,:edit]
   resources :account_packages,only:[:index]
   resources :registration,only:[:create]

 end
end
