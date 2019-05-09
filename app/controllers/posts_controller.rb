class PostsController < ApplicationController
  def show
    @subreddit_name = params[:subreddit_id]
    @post_id = params[:id]
    @comments_array = get_comments
    @original_post = get_post
  end

  def make_request(index)
    request = RestClient.get "https://api.reddit.com/r/#{@subreddit_name}/comments/#{@post_id}"
    parsed_response = JSON.parse(request.body)
    posts = parsed_response[index]["data"]["children"]
  end

  def create_useful_data_structure(posts)
    useful_data = []
    posts.each do |json|
      useful_data << {body: json["data"]["body"], author: json["data"]["author"]}
    end
    useful_data
  end

  def create_post_data(post)
    {title: post[0]["data"]["title"], url: post[0]["data"]["url"], author: post[0]["data"]["author"]}
  end


  def get_comments
    create_useful_data_structure(make_request(1))
  end

  def get_post
    create_post_data(make_request(0))
  end
end
