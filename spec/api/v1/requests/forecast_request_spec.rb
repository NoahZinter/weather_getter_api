require 'rails_helper'

RSpec.describe 'Forecast Requests' do
  describe '#index' do
    it 'returns a forecast' do
      get '/api/v1/forecast?location=denver,co'

      expect(response.status).to eq 200

      forecast = JSON.parse(response.body, symbolize_names: true)
      
    end
  end
end