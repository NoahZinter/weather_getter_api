class BreweriesFacade
  def self.search(location, quantity)
    Breweries.new(location, quantity)
  end
end