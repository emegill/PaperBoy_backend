class FeedsController < ApplicationController
  def index
  feed_id = params[:feed_id]

  articles = Feed.find(feed_id).articles
  render json: articles
  end
end
