require 'rails_helper'

RSpec.describe BreweryService do
  describe 'list_breweries' do
    it 'retrieves breweries by lat and lng' do
      lat = 39.738453
      lon = -104.984853
      brew_list = BreweryService.list_breweries(lat, lon)
      binding.pry
    end
  end
end