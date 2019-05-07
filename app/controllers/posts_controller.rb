class PostsController < ApplicationController
  def index
    @subreddit_name = params[:subreddit_id]
    binding.pry
  end
end
