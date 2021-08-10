require 'rails_helper'

RSpec.describe 'Sessions Requests' do
  describe '#create' do
    it 'creates a session for found user' do
      api_key = SecureRandom.urlsafe_base64
      user = User.new(email: 'e@mail.com', password: 'example', api_key: api_key)
      user.save

      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "e@mail.com",
        "password": "example",
      }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq 200

      session_user = JSON.parse(response.body, symbolize_names: true)

      expect(session_user).to have_key(:data)
      expect(session_user[:data]).is_a? Hash
      expect(session_user[:data]).to have_key(:id)
      expect(session_user[:data][:id]).is_a? String
      expect(session_user[:data]).to have_key(:type)
      expect(session_user[:data][:type]).to eq 'users'
      expect(session_user[:data]).to have_key(:attributes)
      expect(session_user[:data][:attributes]).is_a? Hash
      expect(session_user[:data][:attributes]).to have_key(:email)
      expect(session_user[:data][:attributes][:email]).to eq 'e@mail.com'
      expect(session_user[:data][:attributes]).to have_key(:api_key)
      expect(session_user[:data][:attributes][:api_key]).to eq api_key
      expect(session_user[:data][:attributes]).not_to have_key(:password)
      expect(session_user[:data][:attributes]).not_to have_key(:password_digest)
    end

    it 'returns an error for incorrect user' do
      api_key = SecureRandom.urlsafe_base64
      user = User.new(email: 'e@mail.com', password: 'example', api_key: api_key)
      user.save

      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "ex@ample.com",
        "password": "example",
      }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq 401
      expect(response.body).to eq 'Error: Bad Credentials'
    end

    it 'returns the same error for incorrect password' do
      api_key = SecureRandom.urlsafe_base64
      user = User.new(email: 'e@mail.com', password: 'example', api_key: api_key)
      user.save

      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "e@mail.com",
        "password": "wrong_password",
      }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user_params)

      expect(response.status).to eq 401
      expect(response.body).to eq 'Error: Bad Credentials'
    end
  end
end
