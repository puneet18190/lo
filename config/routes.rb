Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'registrations' }
  get 'home/index'
  root 'home#index'
  match 'info' => 'home#info', via: :get
  match 'start' => 'home#start', via: :get  
  match 'thank-you' => 'home#completed', via: :get  
  match '/questions/:id' => 'home#questions', via: :get
  match '/questions/:id' => 'home#add_answer', via: :post
  match '/send_report' => 'home#send_report', via: :get
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
