require 'rails_helper'

RSpec.describe BreweryFacade do
  describe '.list' do
    it 'can make an array of breweries' do
      lat = 39.738453
      lon = -104.984853
      limit = '5'
      brews = BreweryFacade.list(lat, lon, limit)
      brews.each do |brewery|
        expect(brewery).is_a? Brewery
        expect(brewery.id).is_a? Integer
        expect(brewery.name).is_a? String
        expect(brewery.brewery_type).is_a? String
      end
    end
  end
end