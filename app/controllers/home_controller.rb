class HomeController < ApplicationController
  def index
    @weather = 'waiting'
  end

  def api_call


    response = WeatherApiCall.new(params["search_term"], params['days']).call
    if response[:status] == 200
      @weather = response
      respond_to do |format|
        format.html {redirect_to root_path, notice: 'API call success'}
        format.turbo_stream
      end
    else
      redirect_to root_path, notice: 'Must include a term'
    end
  end

end
