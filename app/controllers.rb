SnippetsApi::App.controllers  do

  get :index do
    @snippets = Snippet.all
    render :index
  end
  
  post :user, :csrf_protection => false do

    # TODO: Add some sort of key checking.
    #puts "Params: #{params.inspect}"
    if not params["snippet_data"].nil?
      hashes = JSON.parse(params[:snippet_data]).delete_if {|a| a.nil? }
      p hashes
      hashes = hashes.map do |hash|
        snip = Snippet.find_or_initialize_by(uuid: hash["uuid"])
        snip.text = hash["text"]
        snip.user_id = hash["user_id"]
        snip.created = hash["created"]
        s.save

        snip
      end
      puts "Snippets: #{hashes.inspect}"
    else
      logger.push("Not a valid post request: #{params.inspect}", :warn)
    end

    content_type :json
    Snippet.all.to_a.to_json
  end
end
