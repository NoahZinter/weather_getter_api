require 'rails_helper'

RSpec.describe Breweries do
  describe '#initialize' do
    it 'exists' do
      data = Breweries.new('denver,co', '5')
      expect(data).is_a? Breweries
      expect(data.destination).to eq 'denver,co'
      expect(data.forecast).is_a? Hash
      expect(data.forecast).to have_key(:summary)
      expect(data.forecast[:summary]).is_a? String
      expect(data.forecast).to have_key(:temperature)
      expect(data.forecast[:temperature]).to be_a(Float).or be_a(Integer)
      expect(data.breweries).is_a? Array
      expect(data.breweries.length).to eq 5
      data.breweries.each do |brew|
        expect(brew).is_a? Brewery
        expect(brew.id).is_a? Integer
        expect(brew.name).is_a? String
        expect(brew.brewery_type).is_a? String
      end
    end
  end
end