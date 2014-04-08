SnippetsApi::App.controllers  do

  get :index do
    "Snippets API"
  end
  
  post :user, :csrf_protection => false do
    logger.info "Recieved: #{params.inspect}"

    content_type :json
    [].to_json
  end
end
