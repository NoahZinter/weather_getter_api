class Api::V1::BreweriesController < ApplicationController
  def index
    BreweriesFacade.search(params[:location], params[:quantity])
  end
end