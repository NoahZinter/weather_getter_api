require 'rails_helper'

RSpec.describe DirectionsService do
  describe '.get_travel_time' do
    it 'gets travel_time from two endpoints' do
      travel_time = DirectionsService.get_travel_time('new york,ny', 'los angeles,ca')
      expect(travel_time).is_a? String
      expect(travel_time).to eq "40:34:31"
    end

    it 'does not return time for impossible travel' do
      nil_time = DirectionsService.get_travel_time('london,england', 'new york,ny')
      expect(nil_time).to be_nil
    end
  end
end