class SubredditsController < ApplicationController
  def index
  end

  def show
    @subreddit_name = params[:id]
  end
end
