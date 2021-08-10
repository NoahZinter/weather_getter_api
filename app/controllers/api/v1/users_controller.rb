class Api::V1::UsersController < ApplicationController
  def create
    if params[:password] != params[:password_confirmation]
      render json: "Error: Password and Confirmation Do Not Match", status: 400
    elsif params[:email] == ''
      render json: 'Error: User Email Missing', status: 400
    elsif params[:password] == ''
      render json: 'Error: User Password Missing', status: 400
    elsif User.find_by(email: params[:email]).present?
      render json: "Error: Email Taken", status:400
    else
      new_user = User.new(email: params[:email], password: params[:password], api_key: SecureRandom.urlsafe_base64)
      if new_user.save
        render json: UsersSerializer.new(new_user).serializable_hash.to_json, status: 201
      end
    end
  end
end
