class WeatherApiCall
  require 'typhoeus'
  require 'typhoeus/cache/rails'
  Typhoeus::Config.cache = Typhoeus::Cache::Rails.new
  def initialize(query, days)

    @query = query
    @days = days
  end
  def call

    request = Typhoeus::Request.new(
      "http://api.weatherapi.com/v1/forecast.json?key=#{Rails.application.credentials.weather_key}&q=#{@query}&days=#{@days}&aqi=no&alerts=no",
      method: 'get',
      cache_ttl: 1800
    ).run

    p "cached #{request.cached?}"
    parsed_body = JSON.parse(request.response_body)
    {location: parsed_body['location'],
     cached: request.cached?,
     current: parsed_body['current'],
     status: request.response_code,
     days: parsed_body['forecast']['forecastday'].map {|d| d.fetch_values('date', 'day')},
    }
  end

end