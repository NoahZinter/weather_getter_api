class RoadtripFacade
  def self.plan(origin, destination)
    Roadtrip.new(origin, destination)
  end
end