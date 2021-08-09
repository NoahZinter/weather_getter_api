class BreweriesFacade
  coords = GeocodeService.geocode(location)
  fcast = ForecastService.get_forecast(coords[:lat], coords[:lng])
end