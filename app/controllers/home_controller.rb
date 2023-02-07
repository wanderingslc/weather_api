class HomeController < ApplicationController
  def index
  end

  def api_call
    binding.pry
    response = WeatherApiCall.new.call
  end
end
