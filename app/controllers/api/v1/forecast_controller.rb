class Api::V1::ForecastController < ApplicationController
  def index
    fcast = ForecastFacade.forecast(params[:location])
    render json: ForecastSerializer.new(fcast).serializable_hash.to_json
  end
end