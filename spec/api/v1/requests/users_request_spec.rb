require 'rails_helper'

RSpec.describe 'Users Requests' do
  describe '#create' do
    it 'creates a user' do
      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "e@mail.com",
        "password": "example",
        "password_confimation": "example"
      }
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)

      expect(response.status).to eq 201
      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).is_a? Hash
      expect(user[:data]).to have_key(:id)
      expect(user[:data][:id]).is_a? String
      expect(user[:data]).to have_key(:type)
      expect(user[:data][:type]).to eq 'users'
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).is_a? Hash
      expect(user[:data][:attributes][:email]).to eq 'e@mail.com'
      expect(user[:data][:attributes]).not_to have_key(:password)
      expect(user[:data][:attributes]).to have_key(:api_key)
      expect(user[:data][:attributes][:api_key]).is_a? String
    end

    it 'does not create incorrect password' do
      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "e@mail.com",
        "password": "example",
        "password_confimation": "apple"
      }
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      expect(response.status).to eq 400
      expect(response.body).to eq 'Error: Password and Confirmation Do Not Match'
    end

    it 'does not create with absent email' do
      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "",
        "password": "example",
        "password_confimation": "example"
      }
      post '/api/v1/users', headers: headers, params: JSON.generate(user: user_params)
      expect(response.status).to eq 400
      expect(response.body).to eq 'Error: User Email Missing'
    end
  end
end