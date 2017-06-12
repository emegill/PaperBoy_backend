class UsersController < ApplicationController
  def index
    logging_in_user = User.where(username: params[:username]).first
    p logging_in_user

    if logging_in_user.password === params[:password]
      logging_users = logging_in_user.id

      logged_in_state = {views: true, user_id: logging_users}
      render json: logged_in_state

    else

      logged_in_state = false
      render json: logged_in_state
    end

  end

  def create
    User.create(user_params)
    # user_name = user_params[:username]
    # user_id = User.where(username: user_name).first.id
    # Feed.create(user_id: user_id)

  end


  private

  def user_params
    params.permit(:data).require(:username, :password)

  end
end
