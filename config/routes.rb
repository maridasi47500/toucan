Rails.application.routes.draw do

#scope ':locale' do
#  root # matches /en/
get 'loadreviews', to: "review#loadreviews", as: :loadreviews
post 'creerreview', to: 'review#create', as: :creerreview
resources :reviews, path: 'review' do
  get 'newreview', on: :new

end
#end

  devise_for :bookshoppers, controllers: {registrations: 'bookshoppers/signup', sessions: 'bookshoppers/signin' }
  devise_for :clients, controllers: {registrations: 'clients/signup', sessions: 'clients/signin' }
get 'photos', to: 'review#photos'
get 'mynote', to: 'review#newreview'
  post 'clients/pass', to: 'clients/signin#newpass', as: :cloginpass
  get 'clients/signup/new', to: 'clients/signup#new', as: :cnewsignup
post 'createnewclient', to: "clients/signup#create", as: :createnewclient
  get 'clients/login/new', to: 'clients/signin#new', as: :cnewlogin

  post 'bookshoppers/pass', to: 'bookshoppers/signin#newpass', as: :bsloginpass
  get 'bookshoppers/signup/new', to: 'bookshoppers/signup#new', as: :bsnewsignup
post 'createnewbookshopper', to: "bookshoppers/signup#create", as: :createnewbookshopper
  get 'bookshoppers/login/new', to: 'bookshoppers/signin#new', as: :bsnewlogin

post 'newclient', to: "clients/signin#create", as: :seconnecter
  get 'local/review', to: 'review#new', as: :newreview
  get 'allreviews', to: 'review#index', as: :allreviews
  get 'local/reviews', to: 'review#all', as: :knowmore
  get 'local/writereview', to: 'review#write', as: :writereview, locale: :fr



  root to: 'welcome#index'
end
