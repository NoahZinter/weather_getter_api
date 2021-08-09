class GeocodeService
  def self.geocode(location)
    url = 'http://www.mapquestapi.com/geocoding/v1/address'
    res = Faraday.get(url, {key: ENV['MAPQUEST_API_KEY'], location: location })
    parsed = JSON.parse(res.body, symbolize_names: true)
    latLng = parsed[:results][0][:locations][0][:latLng]
  end
end