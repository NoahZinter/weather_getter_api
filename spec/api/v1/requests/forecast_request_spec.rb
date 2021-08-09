require 'rails_helper'

RSpec.describe 'Forecast Requests' do
  describe '#index' do
    it 'returns a forecast' do
      get '/api/v1/forecast?location=denver,co'

      expect(response.status).to eq 200

      forecast = JSON.parse(response.body, symbolize_names: true)

      expect(forecast[:data]).to have_key(:id)
      expect(forecast[:data][:id]).to eq 'null'
      expect(forecast[:data]).to have_key(:type)
      expect(forecast[:data][:type]).to eq 'forecast'
      expect(forecast[:data][:attributes]).to have_key(:current)
      expect(forecast[:data][:attributes][:current]).is_a? Hash
      expect(forecast[:data][:attributes][:current]).to have_key(:datetime)
      expect(forecast[:data][:attributes][:current]).to have_key(:sunrise)
      expect(forecast[:data][:attributes][:current]).to have_key(:sunset)
      expect(forecast[:data][:attributes][:current]).to have_key(:temperature)
      expect(forecast[:data][:attributes][:current]).to have_key(:feels_like)
      expect(forecast[:data][:attributes][:current]).to have_key(:humidity)
      expect(forecast[:data][:attributes][:current]).to have_key(:uvi)
      expect(forecast[:data][:attributes][:current]).to have_key(:visibility)
      expect(forecast[:data][:attributes][:current]).to have_key(:conditions)
      expect(forecast[:data][:attributes][:current]).to have_key(:icon)
      expect(forecast[:data][:attributes]).to have_key(:daily)
      expect(forecast[:data][:attributes][:daily]).is_a? Array
      expect(forecast[:data][:attributes][:daily].length).to eq 5
      forecast[:data][:attributes][:daily].each do |day|
        expect(day).to have_key(:date)
        expect(day[:date]).is_a? Date
        expect(day).to have_key(:sunrise)
        expect(day[:sunrise]).is_a? DateTime
        expect(day).to have_key(:sunset)
        expect(day[:sunset]).is_a? DateTime
        expect(day).to have_key(:max_temp)
        expect(day[:max_temp]).to be_a(Float).or be_a(Integer)
        expect(day).to have_key(:min_temp)
        expect(day[:min_temp]).to be_a(Float).or be_a(Integer)
        expect(day).to have_key(:conditions)
        expect(day[:conditions]).is_a? String
        expect(day).to have_key(:icon)
        expect(day[:icon]).is_a? String
      end
      expect(forecast[:data][:attributes]).to have_key(:hourly)
      expect(forecast[:data][:attributes][:hourly]).is_a? Array
      expect(forecast[:data][:attributes][:hourly].length).to eq 8
      forecast[:data][:attributes][:hourly].each do |hour|
        expect(hour).to have_key(:time)
        expect(hour[:time]).is_a? DateTime
        expect(hour).to have_key(:temperature)
        expect(hour[:temperature]).to be_a(Float).or be_a(Integer)
        expect(hour).to have_key(:conditions)
        expect(hour[:conditions]).is_a? String
        expect(hour).to have_key(:icon)
        expect(hour[:icon]).is_a? String
      end
    end
  end
end