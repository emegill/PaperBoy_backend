class FeedsController < ApplicationController
  def index
  feed_id = params[:feed_id]



  newssites = Feed.find(feed_id).newssites
  newssites_json = newssites.as_json


  newssites_json. each_with_index do |newssite, index|

    newssite[:articles] =  newssites[index].articles
  end

  render json: newssites_json
    end

end
