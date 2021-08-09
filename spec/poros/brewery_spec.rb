require 'rails_helper'

RSpec.describe Brewery do
  describe '#initialize' do
    it 'exists' do
      lat = 39.738453
      lon = -104.984853
      limit = '1'
      data = BreweryService.list_breweries(lat, lon, limit)
      brew = Brewery.new(data[0])

      expect(brew).is_a? Brewery
      expect(brew.id).is_a? Integer
      expect(brew.name).is_a? String
      expect(brew.brewery_type).is_a? String
    end
  end
end