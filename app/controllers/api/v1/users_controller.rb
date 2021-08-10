class Api::V1::UsersController < ApplicationController
  def create
    if user_params[:password] != user_params[:password_confimation]
      render json: "Error: Password and Confirmation Do Not Match", status: 400
    else
      new_user = User.new(email: user_params[:email], password_digest: user_params[:password], api_key: SecureRandom.urlsafe_base64)
      if new_user.save
        render json: UsersSerializer.new(new_user).serializable_hash.to_json, status: 201
      else
        render json: 'Error', status: 400
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confimation)
  end
end
