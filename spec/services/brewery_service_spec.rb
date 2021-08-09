require 'rails_helper'

RSpec.describe BreweryService do
  describe 'list_breweries' do
    it 'retrieves breweries by lat and lng' do
      lat = 39.738453
      lon = -104.984853
      limit = '5'
      brew_list = BreweryService.list_breweries(lat, lon, limit)

      expect(brew_list).is_a? Array
      expect(brew_list.length).to eq 5
    end
  end
end