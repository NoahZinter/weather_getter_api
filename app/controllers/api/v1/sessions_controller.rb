class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UsersSerializer.new(user).serializable_hash.to_json
    else
      render json: 'Error: Bad Credentials', status: 401
    end
  end
end