defmodule SoggyWaffle do
  def rain?(city, datetime) do

   weather_api_module =
      Application.get_env(
        :soggy_waffle,
        :weather_api_module,
        SoggyWaffle.WeatherAPI
      )

    response = weather_api_module.get_forecast(city)
    IO.inspect(response)
    response = elem(response,1)

    

    weather_data = SoggyWaffle.WeatherAPI.ResponseParser.parse_response(response)
    weather_data = elem(weather_data, 1)

    IO.inspect(weather_data)

    SoggyWaffle.Weather.imminent_rain?(weather_data, datetime)
      
  end
end