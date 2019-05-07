class PostsController < ApplicationController
  def index
    @subreddit_name = params[:subreddit_id]
    @images = make_request
  end

  def make_request
    title_and_links = []
    request = RestClient.get "https://api.reddit.com/r/#{@subreddit_name}"
    parsed_response = JSON.parse(request.body)
    posts = parsed_response["data"]["children"]
    posts.each do |json|
      if json["data"]["url"].include?(".jpg")
        title_and_links << {title: json["data"]["title"], url: json["data"]["url"]}
      end
    end
    title_and_links
  end
end
