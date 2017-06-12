class FeedsController < ApplicationController
    def create
        Feed.create(feed_params)

        success = User.find(feed_params).feed
        render json: success
    end

    private

    def feed_params

        params.require(:data).permit(:users_id)
    end
end
