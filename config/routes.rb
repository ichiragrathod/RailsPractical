Rails.application.routes.draw do

  get '/about', to: "abouts#info"
end
