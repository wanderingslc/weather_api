class WeatherApiCall
  require 'typhoeus'

  def call
    request = Typhoeus::Request.new(
      'http://api.weatherapi.com/v1/current.json',
      method: 'get',
      params: {key: Rails.application.credentials.weather_key,
               q: '40.6799047,-111.8910521'}
    )
    request.run.response_body
  end
end