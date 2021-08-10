class DirectionsService
  def self.get_travel_time(origin, destination)
    url = 'http://www.mapquestapi.com/directions/v2/route'
    res = Faraday.get(url, {key: ENV['MAPQUEST_API_KEY'], from: origin, to: destination})
    directions = JSON.parse(res.body, symbolize_names: true)
    directions[:route][:formattedTime]
  end
end