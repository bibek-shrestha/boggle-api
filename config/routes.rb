Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html'
  namespace :api do
    namespace :v1 do
      get "generate", controller: :letters, action: :index
      get "validate", controller: :letters, action: :validate
    end
  end
end
