class BreweryService.rb
  def self.list_breweries(lat, lng)
    url = 'https://api.openbrewerydb.org/breweries'
    res = Faraday.get(url, {by_dist: "#{lat},#{lng}"})
    JSON.parse(res.body, symbolize_names: true)
  end
end