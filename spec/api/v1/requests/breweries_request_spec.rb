require 'rails_helper'

RSpec.describe 'Breweries Requests' do
  describe '#index' do
    it 'returns serialized breweries' do
      get '/api/v1/breweries?location=denver,co&quantity=5'

      expect(response.status).to eq 200
      breweries = JSON.parse(response.body, symbolize_names: true)

      expect(breweries).to have_key(:data)
      expect(breweries[:data]).is_a? Hash
      expect(breweries[:data]).to have_key(:id)
      expect(breweries[:data][:id]).to eq 'null'
      expect(breweries[:data]).to have_key(:type)
      expect(breweries[:data][:type]).to eq 'breweries'
      expect(breweries[:data]).to have_key(:attributes)
      expect(breweries[:data][:attributes]).is_a? Hash
      expect(breweries[:data][:attributes]).to have_key(:destination)
      expect(breweries[:data][:attributes][:destination]).to eq 'denver,co'
      expect(breweries[:data][:attributes]).to have_key(:forecast)
      expect(breweries[:data][:attributes][:forecast]).is_a? Hash
      expect(breweries[:data][:attributes][:forecast]).to have_key(:summary)
      expect(breweries[:data][:attributes][:forecast][:summary]).is_a? String
      expect(breweries[:data][:attributes][:forecast]).to have_key(:temperature)
      expect(breweries[:data][:attributes][:forecast][:temperature]).to be_a(Float).or be_a(Integer)
      expect(breweries[:data][:attributes]).to have_key(:breweries)
      expect(breweries[:data][:attributes][:breweries]).is_a? Array
      breweries[:data][:attributes][:breweries].each do |brew|
        expect(brew).is_a? Brewery
        expect(brew[:id]).is_a? Integer
        expect(brew[:name]).is_a? String
        expect(brew[:brewery_type]).is_a? String
      end
    end
  end
end