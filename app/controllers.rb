SnippetsApi::App.controllers  do

  get :index do
    "Snippets API"
  end
  
  post :user do
    logger.info "Recieved: #{params.inspect}"

    content_type :json
    [].to_json
  end
end
