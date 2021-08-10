class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: session_params[:email])
    if user && user.authenticate(session_params[:password])
      render json: UsersSerializer.new(user).serializable_hash.to_json
    else
      render json: 'Error: Bad Credentials', status: 400
    end

  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end