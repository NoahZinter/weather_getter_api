class ForecastService
  def self.get_forecast(lat, lon)
    url = 'https://api.openweathermap.org/data/2.5/onecall'
    res = Faraday.get(url, {units: 'imperial', lat: lat, lon: lon, appid: ENV['WEATHER_API_KEY']})
    JSON.parse(res.body, symbolize_names: true)
  end
end