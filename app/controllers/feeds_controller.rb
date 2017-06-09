class FeedsController < ApplicationController
    def index
        Feed.create(feed_params)

        feed = Feed.all
        render json:  feed
    end

    private

    def feed_params

        params.require(:data).permit(:news_id)
    end
end
