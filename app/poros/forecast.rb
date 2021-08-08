class Forecast
  attr_reader :current,
              :daily,
              :hourly
  def initialize(data)
    @current = { datetime: time_converter(data[:current][:dt]),
                 sunrise: time_converter(data[:current][:sunrise]),
                 sunset: time_converter(data[:current][:sunset]),
                 temperature: data[:current][:temp],
                 feels_like: data[:current][:feels_like],
                 humidity: data[:current][:humidity],
                 uvi: data[:current][:uvi],
                 visibility: data[:current][:visibility],
                 conditions: data[:current][:weather][0][:description],
                 icon: data[:current][:weather][0][:icon]
               }
    @daily = daily_forecaster(data[:daily])
    @hourly = hourly_forecaster(data[:hourly])
  end

  def time_converter(utc_time)
    DateTime.strptime(utc_time.to_s, '%s')
  end

  def daily_forecaster(days)
    days.map do |h|
      { date: time_converter(h[:dt]).to_date,
        sunrise: time_converter(h[:sunrise]),
        sunset: time_converter(h[:sunset]),
        max_temp: h[:temp][:max],
        min_temp: h[:temp][:min],
        conditions: h[:weather][0][:description],
        icon: h[:weather][0][:icon]
      }
    end
  end

  def hourly_forecaster(hours)
    hours.map do |h|
      { time: time_converter(h[:dt]).to_time,
        temperature: h[:temp],
        conditions: h[:weather][0][:description],
        icon: h[:weather][0][:icon]
      }
    end
  end
end