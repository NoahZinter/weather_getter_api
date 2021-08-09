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
    end
  end
end