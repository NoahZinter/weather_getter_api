class BreweryFacade
  def self.list(lat, lon, limit)
    data = BreweryService.list_breweries(lat, lon, limit)
    data.map do |hash|
      Brewery.new(hash)
    end
  end
end