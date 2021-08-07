require 'rails_helper'

RSpec.describe ForecastService do
  describe '.get_forecast' do
    it 'retrieves forecast with lat and lng' do
      lat = 39.738453
      lon = -104.984853
      data = ForecastService.get_forecast(lat, lon)

      expect(data[:lat].round(2)).to eq lat.round(2)
      expect(data[:lon].round(2)).to eq lon.round(2)
      expect(data[:timezone]).to eq 'America/Denver'
      expect(data[:current]).is_a? Hash
    end
  end
end