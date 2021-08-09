class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confimation]
      render json: "Error", status: 400
    else
      new_user = User.new(email: params[:email], password_digest: params[:password], api_key: SecureRandom.urlsafe_base64)
      if new_user.save
        render json: UserSerializer.new(new_user).serializable_hash.to_json
      else
        render json: 'Error', status: 400
      end
    end
  end
end
