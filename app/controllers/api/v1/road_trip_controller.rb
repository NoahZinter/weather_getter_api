class Api::V1::RoadTripController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      trip = RoadtripFacade.plan(params[:origin], params[:destination])
      render json: RoadtripSerializer.new(trip).serializable_hash.to_json
    else
      render json: 'Error: Bad Credentials: Check Api Key', status: 401
    end
  end
end