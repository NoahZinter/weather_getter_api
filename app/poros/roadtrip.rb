class Roadtrip
  attr_reader :id,
              :start_city,
              :end_city,
              :travel_time,
              :hours,
              :weather_at_eta
  def initialize(origin, destination)
    @start_city = origin
    @end_city = destination
    @travel_time = travel_time_formatter(origin, destination)
    @hours = hour_formatter(origin, destination)
    @weather_at_eta = weather_formatter
  end

  def travel_time_formatter(origin, destination)
    t_time = DirectionsService.get_travel_time(origin, destination)
    if t_time.nil?
      t_time = "impossible"
    else
      t_time = "#{t_time[0..1]} hours, #{t_time[3..4]} minutes"
    end
    t_time
  end

  def hour_formatter(origin, destination)
    t_time = DirectionsService.get_travel_time(origin, destination)
    if t_time.nil?
      t_time = "impossible"
    else
      t_time = t_time[0..1].to_i
    end
    t_time
  end

  def weather_formatter
    if @hours != 'impossible'
      ForecastService.future_weather(@end_city, @hours)
    else
      @hours
    end
  end
end