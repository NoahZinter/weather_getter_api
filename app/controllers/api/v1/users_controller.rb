class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirmation]
      render json: "Error: Password and Confirmation Do Not Match", status: 400
    else
      new_user = User.new(email: params[:email], password_digest: params[:password], api_key: SecureRandom.urlsafe_base64)
      if new_user.save
        render json: UsersSerializer.new(new_user).serializable_hash.to_json, status: 201
      else
        render json: 'Error: User Email Missing', status: 400
      end
    end
  end
end
