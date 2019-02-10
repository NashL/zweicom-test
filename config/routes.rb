Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/fibonacci/:number' => 'fibonacci#fibonacci'
    end
  end
end
