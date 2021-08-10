require 'rails_helper'

RSpec.describe ForecastService do
  describe 'future_weather' do
    it 'returns temp and conditions when given a city and time offset' do
      forecast = ForecastService.future_weather('los angeles,ca', 40)

      expect(forecast).is_a? Hash
      expect(forecast).to have_key(:temperature)
      expect(forecast[:temperature]).to be_a(Float).or be_a(Integer)
      expect(forecast).to have_key(:conditions)
      expect(forecast[:conditions]).is_a? String
    end
  end
end