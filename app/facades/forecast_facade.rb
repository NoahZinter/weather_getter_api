class ForecastFacade
  def self.forecast(location)
    coords = GeocodeService.geocode(location)
    data = ForecastService.get_forecast(coords[:lat], coords[:lng])
    Forecast.new(data)
  end
end