Rails.application.routes.draw do
    get '', to: 'games#index'
    get 'games/', to: 'games#index'
    get 'game/:game_id', to: 'games#show'
    get 'game/roll/:player_id(/:dice_sides)', to: 'games#roll'
    get 'game/reroll/:player_id(/:dice_sides)', to: 'games#reroll'

    post 'setup', to: 'games#setup'

    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/graphql' if Rails.env.development?
    post '/graphql', to: 'graphql#execute'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
    # Can be used by load balancers and uptime monitors to verify that the app is live.
    get 'up' => 'rails/health#show', as: :rails_health_check

    # Defines the root path route ("/")
    # root "posts#index"
end
