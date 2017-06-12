class UsersController < ApplicationController
  def index
    logging_in_user = User.where(username: params[:username]).first
    p logging_in_user

    if logging_in_user.password === params[:password]
      logging_users = logging_in_user.id

      logged_in_state = {views: true, user_id: logging_users}
      render json: logged_in_state

    else
        loggedInState = false
        render json:  loggedInState
    end

    end

    def create

        User.create(user_params)

    end

    private

    def user_params
        params.require(:data).permit(:username, :password)
    end
end
