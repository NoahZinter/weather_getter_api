require 'rails_helper'

RSpec.describe 'Road Trip Requests' do
  describe 'create' do
    it 'creates a road trip' do
      api_key = SecureRandom.urlsafe_base64
      user = User.new(email: 'e@mail.com', password: 'example', api_key: api_key)
      user.save
      headers = {"CONTENT_TYPE"=> "application/json"}
      roadtrip_params = {
        "origin": "new york,ny",
        "destination": "los angeles, ca",
        "api_key": api_key
      }
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(roadtrip_params)

      expect(response.status).to eq 200
      road_trip = JSON.parse(response.body, symbolize_names: true)

      expect(road_trip).is_a? Hash
      expect(road_trip).to have_key(:data)
      expect(road_trip[:data]).is_a? Hash
      expect(road_trip[:data]).to have_key(:id)
      expect(road_trip[:data][:id]).to eq 'null'
      expect(road_trip[:data]).to have_key(:type)
      expect(road_trip[:data][:type]).to eq 'roadtrip'
      expect(road_trip[:data]).to have_key(:attributes)
      expect(road_trip[:data][:attributes]).is_a? Hash
      expect(road_trip[:data][:attributes]).to have_key(:start_city)
      expect(road_trip[:data][:attributes][:start_city]).to eq 'new york,ny'
      expect(road_trip[:data][:attributes]).to have_key(:end_city)
      expect(road_trip[:data][:attributes][:end_city]).to eq 'los angeles, ca'
      expect(road_trip[:data][:attributes]).to have_key(:travel_time)
      expect(road_trip[:data][:attributes][:travel_time]).to eq '40 hours, 34 minutes'
      expect(road_trip[:data][:attributes]).to have_key(:weather_at_eta)
      expect(road_trip[:data][:attributes][:weather_at_eta]).is_a? Hash
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:temperature)
      expect(road_trip[:data][:attributes][:weather_at_eta][:temperature]).to be_a(Float).or be_a(Integer)
      expect(road_trip[:data][:attributes][:weather_at_eta]).to have_key(:conditions)
      expect(road_trip[:data][:attributes][:weather_at_eta][:conditions]).is_a? String
      expect(road_trip[:data][:attributes][:weather_at_eta]).not_to have_key(:visibility)
      expect(road_trip[:data][:attributes][:weather_at_eta]).not_to have_key(:icon)
      expect(road_trip[:data][:attributes][:weather_at_eta]).not_to have_key(:humidity)
      expect(road_trip[:data][:attributes][:weather_at_eta]).not_to have_key(:min_temp)
      expect(road_trip[:data][:attributes][:weather_at_eta]).not_to have_key(:max_temp)
    end

    it 'does not create a road trip without api key' do
      headers = {"CONTENT_TYPE"=> "application/json"}
      roadtrip_params = {
        "origin": "new york,ny",
        "destination": "los angeles, ca"
      }
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(roadtrip_params)

      expect(response.status).to eq 401
      expect(response.body).to eq 'Error: Bad Credentials: Check Api Key'
    end

    it 'does not create a road trip with bad api key' do
      api_key = SecureRandom.urlsafe_base64
      user = User.new(email: 'e@mail.com', password: 'example', api_key: api_key)
      user.save
      headers = {"CONTENT_TYPE"=> "application/json"}
      roadtrip_params = {
        "origin": "new york,ny",
        "destination": "los angeles, ca",
        "api_key": 'bad key'
      }
      post '/api/v1/road_trip', headers: headers, params: JSON.generate(roadtrip_params)

      expect(response.status).to eq 401
      expect(response.body).to eq 'Error: Bad Credentials: Check Api Key'
    end
  end
end