class ForecastService
  def self.get_forecast(lat, lon)
    url = 'https://api.openweathermap.org/data/2.5/onecall'
    res = Faraday.get(url, {units: 'imperial', lat: lat, lon: lon, appid: ENV['WEATHER_API_KEY']})
    JSON.parse(res.body, symbolize_names: true)
  end

  def self.future_weather(destination, offset)
    coords = GeocodeService.geocode(destination)
    url = 'https://api.openweathermap.org/data/2.5/onecall'
    res = Faraday.get(url, {units: 'imperial', lat: coords[:lat], lon: coords[:lng], appid: ENV['WEATHER_API_KEY']})
    cast = JSON.parse(res.body, symbolize_names: true)
    final = { temperature: cast[:hourly][offset -1][:temp], conditions: cast[:hourly][offset - 1][:weather][0][:description]}
  end
end