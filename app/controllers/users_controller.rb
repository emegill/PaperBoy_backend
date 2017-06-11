class UsersController < ApplicationController
  def index
    logging_in_user = User.where(username: params[:name]).first

    if logging_in_user.password === params[:password]
      logging_in_users_id = logging_in_user.id

      logged_in_state = {views: true, user_id: logging_in_users_id}
      render json: logged_in_state

    else

      logged_in_state = false
      render json: logged_in_state
    end

  end

  def create
    User.create(user_params)
    
  end


  private

  def user_params
    params.permit(:data).require(:username, :password)

  end
end
