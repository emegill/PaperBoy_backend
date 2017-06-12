class UsersController < ApplicationController
<<<<<<< HEAD
    def index
    loggedUser = User.where(username: params[:name]).first
=======
  def index


    user_name = user_params.except(:password)
    logging_in_user = User.where(username: user_name).first
>>>>>>> e01dabf3408f40436c558eba65dfd9d83e86f70e

    if loggedUser.password === params[:password]

        user_id = loggedUser.id

        loggedInState = {views: true, user_id: user_id }

        render json: loggedInState

    else
        loggedInState = false
        render json:  loggedInState
    end

    end

<<<<<<< HEAD
    def create
=======
  def create
    User.create(user_params)

  end
>>>>>>> e01dabf3408f40436c558eba65dfd9d83e86f70e

        User.create(user_params)

    end

    private

    def user_params
        params.require(:data).permit(:username, :password)
    end
end
