Rails.application.routes.draw do
  root to: "game#play"
  get "play", to: "game#play", as: :play
  post "result", to: "game#result", as: :result
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

## which result post
