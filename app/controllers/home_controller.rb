class HomeController < ApplicationController
  def index
  end

  def api_call
    binding.pry
    @weather = JSON.parse(WeatherApiCall.new(params["city"]).call)
  end
end
