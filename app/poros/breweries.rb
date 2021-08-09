class Breweries
  attr_reader :destination,
              :coords,
              :forecast,
              :breweries,
              :id
  def initialize(location, quantity)
    @destination = location
    @coords = GeocodeService.geocode(location)
    @forecast = simplify_forecast(location)
    @breweries = BreweryFacade.list(@coords[:lat], @coords[:lng], quantity)
    @id = 'null'
  end

  def simplify_forecast(location)
    cast = ForecastFacade.forecast(location)
    {
      summary: cast.current[:conditions],
      temperature: cast.current[:temperature]
    }
  end
end