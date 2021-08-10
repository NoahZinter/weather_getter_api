require 'rails_helper'

RSpec.describe Roadtrip do
  describe 'initialize' do
    it 'exists' do
      trip = Roadtrip.new('new york,ny', 'los angeles,ca')
      binding.pry
      expect(trip).is_a? Roadtrip
      expect(trip.start_city).to eq 'new york,ny'
      expect(trip.end_city).to eq 'los angeles,ca'
      expect(trip.travel_time).to eq '40 hours, 34 minutes'
      # expect(trip.weather_at_eta).is_a? Hash
      # expect(trip.weather_at_eta[:temperature]).to be_a(Float).or be_a(Integer)
      # expect(trip.weather_at_eta[:conditions]).is_a? String
    end
  end
end