class Api::V1::BreweriesController < ApplicationController
  def index
    brews = BreweriesFacade.search(params[:location], params[:quantity])
    render json: BreweriesSerializer.new(brews).serializable_hash.to_json
  end
end