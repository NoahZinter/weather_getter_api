require 'rails_helper'

RSpec.describe Roadtrip do
  describe 'initialize' do
    it 'exists' do
      trip = Roadtrip.new('new york,ny', 'los angeles,ca')

      expect(trip).is_a? Roadtrip
      expect(trip.id).to eq 'null'
      expect(trip.start_city).to eq 'new york,ny'
      expect(trip.end_city).to eq 'los angeles,ca'
      expect(trip.travel_time).is_a? String
      expect(trip.travel_time).to include('40')
      expect(trip.hours).to eq 40
      expect(trip.weather_at_eta).is_a? Hash
      expect(trip.weather_at_eta[:temperature]).to be_a(Float).or be_a(Integer)
      expect(trip.weather_at_eta[:conditions]).is_a? String
    end

    it 'returns impossible for impossible roadtrips' do
      trip = Roadtrip.new('new york,ny', 'london, england')

      expect(trip).is_a? Roadtrip
      expect(trip.id).to eq 'null'
      expect(trip.start_city).to eq 'new york,ny'
      expect(trip.end_city).to eq 'london, england'
      expect(trip.travel_time).to eq 'impossible'
      expect(trip.hours).to eq 'impossible'
      expect(trip.weather_at_eta).to eq({})
    end
  end
end