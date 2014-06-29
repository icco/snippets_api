SnippetsApi::App.controllers  do

  get :index do
    @snippets = Snippet.all
    render :index
  end
  
  post :user, :csrf_protection => false do

    # TODO: Add some sort of key checking.
    if not params["snippet_data"].nil?
      logger.push("recieved: #{params.inspect}", :debug)
      hashes = JSON.parse(params[:snippet_data]).delete_if {|a| a.nil? }
      hashes = hashes.map do |hash|
        logger.push("loading: #{hash.inspect}", :debug)
        snip = Snippet.find_or_initialize_by(uuid: hash["g"])
        snip.text = hash["c"]
        snip.user_id = hash["e"]
        snip.created = Chronic.parse(hash["d"])
        snip.save

        if snip.invalid?
          logger.push("Failed trying to save: #{snip.errors.inspect} (original hash: #{hash.inspect})", :warn)
        end

        snip
      end

      puts "Snippets: #{Snippet.all.inspect}"
    else
      logger.push("Not a valid post request: #{params.inspect}", :warn)
    end

    content_type :json
    Snippet.all.to_a.to_json
  end
end
