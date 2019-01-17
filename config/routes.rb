Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#index'

  scope '/api/v1' do
    devise_for :users,
      :defaults => {
        :format => :json
      },
      :controllers => {
        :sessions => 'api/v1/sessions',
        :passwords => 'api/v1/passwords',
        :confirmations => 'api/v1/confirmations',
        :unlocks => 'api/v1/unlocks'
      }
  end
end
