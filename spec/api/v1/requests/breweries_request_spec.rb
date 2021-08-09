require 'rails_helper'

RSpec.describe 'Breweries Requests' do
  describe '#index' do
    it 'returns serialized breweries' do
      get '/api/v1/breweries?location=denver,co&quantity=5'

      expect(response.status).to eq 200
      binding.pry
    end
  end
end