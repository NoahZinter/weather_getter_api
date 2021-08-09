require 'rails_helper'

RSpec.describe Forecast do
  before :all do
    @lat = 39.738453
    @lon = -104.984853
    @data = ForecastService.get_forecast(@lat, @lon)
    @forecast = Forecast.new(@data)
  end
  describe 'initialize' do
    it 'exists' do
      expect(@forecast).is_a? Forecast
    end

    it 'has current hash' do
      current = @forecast.current
      expect(current).is_a? Hash
      expect(current[:datetime]).is_a? DateTime
      expect(current[:sunrise]).is_a? DateTime
      expect(current[:sunset]).is_a? DateTime
      expect(current[:temperature]).to be_a(Float).or be_a(Integer)
      expect(current[:feels_like]).to be_a(Float).or be_a(Integer)
      expect(current[:humidity]).to be_a(Float).or be_a(Integer)
      expect(current[:visibility]).to be_a(Float).or be_a(Integer)
      expect(current[:conditions]).is_a? String
      expect(current[:icon]).is_a? String
    end

    it 'has daily array' do
      daily = @forecast.daily
      expect(daily).is_a? Array
      daily.each do |day|
        expect(day).is_a? Hash
        expect(day).to have_key(:date)
        expect(day).to have_key(:sunrise)
        expect(day).to have_key(:sunset)
        expect(day).to have_key(:max_temp)
        expect(day).to have_key(:min_temp)
        expect(day).to have_key(:conditions)
        expect(day).to have_key(:icon)
        expect(day[:date]).is_a? Date
        expect(day[:sunrise]).is_a? DateTime
        expect(day[:sunset]).is_a? DateTime
        expect(day[:max_temp]).to be_a(Float).or be_a(Integer)
        expect(day[:min_temp]).to be_a(Float).or be_a(Integer)
        expect(day[:conditions]).is_a? String
        expect(day[:icon]).is_a? String
      end
    end

    it 'daily array only has 5 days'

    it 'has hourly array' do
      hourly = @forecast.hourly
      expect(hourly).is_a? Array
      hourly.each do |hour|
        expect(hour).to have_key(:time)
        expect(hour).to have_key(:temperature)
        expect(hour).to have_key(:conditions)
        expect(hour).to have_key(:icon)
        expect(hour[:time]).is_a? Time
        expect(hour[:temperature]).to be_a(Float).or be_a(Integer)
        expect(hour[:conditions]).is_a? String
        expect(hour[:icon]).is_a? String
      end
    end

    it 'hourly array only has 8 hours'

    it 'does not contain x'
    it 'does not contain x'
    it 'does not contain x'
    it 'does not contain x'
    it 'does not contain x'
    it 'does not contain x'
  end

  describe '#time_converter' do
    it 'converts utc time'

    it 'converts past times'

    it 'converts future times'

    it 'does not convert negative times'
  end

  describe '#daily forecaster' do
    it 'makes an array of hashes'
  end

  describe '#hourly_forecaster' do
    it 'makes an array of hashes'
  end
end