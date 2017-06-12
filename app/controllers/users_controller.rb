class UsersController < ApplicationController
  def index
    logging_in_user = User.where(username: params[:username]).first
    p logging_in_user


    if logging_in_user.password === params[:password]
      logging_users = logging_in_user.id

      feed_id = logging_in_user.feed.id
      logged_in_state = {views: true, user_id: logging_users,feed_id: feed_id}
      render json: logged_in_state

    else
        loggedInState = false
        render json:  loggedInState
    end
  end

  def create
    User.create(user_params)
    user_name = user_params[:username]
    user = User.where(username: user_name).first
    user_id = user.id
    Feed.create(user_id: user_id)
    feed_id = user.feed.id

    logged_in_state = {views: true, user_id: user_id,feed_id: feed_id}
    render json: logged_in_state

    end

    private

    def user_params
        params.require(:data).permit(:username, :password)
    end
end
