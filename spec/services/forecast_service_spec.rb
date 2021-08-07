require 'rails_helper'

RSpec.describe ForecastService do
  before :all do
    @lat = 39.738453
    @lon = -104.984853
    @data = ForecastService.get_forecast(@lat, @lon)
  end
  describe '.get_forecast' do
    it 'retrieves forecast with lat and lng' do
      expect(@data[:lat].round(2)).to eq @lat.round(2)
      expect(@data[:lon].round(2)).to eq @lon.round(2)
      expect(@data[:timezone]).to eq 'America/Denver'
      expect(@data[:current]).is_a? Hash
    end

    it 'contains current weather info' do
      expect(@data[:current][:dt]).is_a? Integer
      string_time = @data[:current][:dt].to_s
      expect(DateTime.strptime(string_time, '%s')).is_a? DateTime
      expect(@data[:current][:sunrise]).is_a? Integer
      expect(DateTime.strptime(@data[:current][:sunrise].to_s, '%s')).is_a? DateTime
      expect(@data[:current][:sunset]).is_a? Integer
      expect(DateTime.strptime(@data[:current][:sunset].to_s, '%s')).is_a? DateTime
      expect(@data[:current][:temp]).to be_a(Float).or be_a(Integer)
      expect(@data[:current][:temp]).to be < 150
      expect(@data[:current][:feels_like]).to be_a(Float).or be_a(Integer)
      expect(@data[:current][:feels_like]).to be < 150
      expect(@data[:current][:humidity]).to be_a(Float).or be_a(Integer)
      expect(@data[:current][:uvi]).to be_a(Float).or be_a(Integer)
      expect(@data[:current][:visibility]).to be_a(Float).or be_a(Integer)
      expect(@data[:current][:weather][0][:description]).is_a? String
      expect(@data[:current][:weather][0][:icon]).is_a? String
    end
  end
end