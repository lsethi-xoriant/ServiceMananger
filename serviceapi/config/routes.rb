Rails.application.routes.draw do
  get 'image/create'

 namespace :api,defaults:{format: 'json'} do

   resources :users,except:[:new,:edit]
   resources :access,only:[:create] do
     collection  do
       delete :logout
     end
   end
   resources :groups,except:[:new,:edit]
   resources :permissions ,only:[:index]
   resources :companies,exept:[:new,:edit]
   resources :stores,exept:[:new,:edit]
   resources :account_packages,only:[:index]
   resources :registration,only:[:create]
   resources :image,only:[:create]

   get 'validation/company/name/:name', to: 'companies#validation_name'
 end
end
