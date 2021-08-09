class BackgroundService
  def self.get_background(query)
    url = 'https://api.unsplash.com/search/photos'
    res = Faraday.get(url, {client_id: ENV['UNSPLASH_API_KEY'],query: query, per_page: 1})
    JSON.parse(res.body, symbolize_names: true)
  end
end