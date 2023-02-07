class WeatherApiCall
  require 'typhoeus'

  def initialize(query)
    @query = query
  end
  def call
    request = Typhoeus::Request.new(
      'http://api.weatherapi.com/v1/current.json',
      method: 'get',
      params: {key: Rails.application.credentials.weather_key,
               q: @query}
    )
    request.run.response_body
  end
end