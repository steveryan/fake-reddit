class SubredditsController < ApplicationController
  def index
  end

  def show
    @subreddit_name = params[:id]
    @posts_array = get_title_and_images
  end

  def make_request
    request = RestClient.get "https://api.reddit.com/r/#{@subreddit_name}"
    parsed_response = JSON.parse(request.body)
    posts = parsed_response["data"]["children"]
  end

  def create_useful_data_structure(posts)
    useful_data = []
    posts.each do |json|
      if json["data"]["url"].include?(".jpg")
        useful_data << {title: json["data"]["title"], url: json["data"]["url"], author: json["data"]["author"]}
      end
    end
    useful_data
  end

  def get_title_and_images
    create_useful_data_structure(make_request)
  end
end
