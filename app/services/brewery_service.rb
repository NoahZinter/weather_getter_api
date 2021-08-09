class BreweryService
  def self.list_breweries(lat, lng, limit)
    url = 'https://api.openbrewerydb.org/breweries'
    res = Faraday.get(url, {by_dist: "#{lat},#{lng}", per_page: limit})
    JSON.parse(res.body, symbolize_names: true)
  end
end