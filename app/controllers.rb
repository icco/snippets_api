SnippetsApi::App.controllers  do

  get :index do
    @snippets = Snippet.all
    render :index
  end
  
  post :user, :csrf_protection => false do

    # TODO: Add some sort of key checking.
    if not params["snippet_data"].nil?
      logger.push("recieved: #{params.inspect}", :warn)
      hashes = JSON.parse(params[:snippet_data]).delete_if {|a| a.nil? }
      logger.push("parsed: #{hashes.inspect}", :warn)
      hashes = hashes.map do |hash|
        logger.push("loading: #{hash.inspect}", :warn)
        snip = Snippet.find_or_initialize_by(uuid: hash["uuid"])
        snip.text = hash["text"]
        snip.user_id = hash["userId"]
        snip.created = hash["created"]
        snip.save

        logger.push("trying to save: #{snip}, #{snip.errors}", :warn)

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
