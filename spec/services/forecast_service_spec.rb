require 'rails_helper'

RSpec.describe ForecastService do
  describe '.get_forecast' do
    it 'retrieves forecast with lat and lng' do
      lat = 39.738453
      lng = -104.984853
      data = ForecastService.get_forecast(lat, lng)

      binding.pry
    end
  end
end