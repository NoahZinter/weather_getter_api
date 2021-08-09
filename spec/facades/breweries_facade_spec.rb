require 'rails_helper'

RSpec.describe BreweriesFacade do
  it 'creates a new breweries object' do
    brew = BreweriesFacade.search('denver,co', '8')

    expect(brew).is_a? Breweries
    expect(brew.destination).to eq 'denver,co'
    expect(brew.forecast).is_a? String
    expect(brew.breweries).is_a? Array
    expect(brew.breweries.length).to eq 8
    brew.breweries.each do |bry|
      expect(bry).is_a? Brewery
      expect(bry.id).is_a? Integer
      expect(bry.name).is_a? String
      expect(bry.brewery_type).is_a? String
    end
  end
end