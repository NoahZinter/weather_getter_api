require 'rails_helper'

RSpec.describe 'Sessions Requests' do
  describe '#create' do
    it 'creates a session' do
      headers = {"CONTENT_TYPE"=> "application/json"}
      user_params = {
        "email": "e@mail.com",
        "password": "example",
      }
      post '/api/v1/sessions', headers: headers, params: JSON.generate(user: user_params)

    end
  end
end