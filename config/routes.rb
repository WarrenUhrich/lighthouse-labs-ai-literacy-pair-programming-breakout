Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # At least 2 routes to handle this...
  # GET  /ask    -> SHOW THE USER A FORM AND STATUS
  # POST /answer -> HANDLE SUBMIT OF ANSWER -> SHOW THE RESULT OR REDIRECT

  get '/ask', to: 'game#ask'
  post '/answer', to: 'game#answer'

end
