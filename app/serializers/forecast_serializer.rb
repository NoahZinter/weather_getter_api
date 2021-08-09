class ForecastSerializer
  include JSONAPI::Serializer
  attributes :current, :daily, :hourly, :id

  set_id {'null'}
end
