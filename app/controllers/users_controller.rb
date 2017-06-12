class UsersController < ApplicationController
  def index


    user_name = user_params.except(:password)
    logging_in_user = User.where(username: user_name).first

    if loggedUser.password === params[:password]

        user_id = loggedUser.id

        loggedInState = {views: true, user_id: user_id }

        render json: loggedInState

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
