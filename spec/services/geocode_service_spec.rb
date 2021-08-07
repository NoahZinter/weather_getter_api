require 'rails_helper'

RSpec.describe GeocodeService do
  describe '.geocode' do
    it 'returns latitude and longitude when given a location' do
      data = GeocodeService.geocode('denver,co')

      expect(data).is_a? Hash
      expect(data).to have_key(:lat)
      expect(data).to have_key(:lng)
      expect(data[:lat]).is_a? Float
      expect(data[:lat]).to eq 39.738453
      expect(data[:lng]).is_a? Float
      expect(data[:lng]).to eq -104.984853
    end
  end
end