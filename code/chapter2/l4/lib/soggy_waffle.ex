defmodule SoggyWaffle do
  def rain?(city, datetime) do
    weather_api_module =
      Application.get_env(
        :soggy_waffle,
        :weather_api_module,
        SoggyWaffle.WeatherAPI
      )


    with {:ok, response} <- weather_api_module.get_forecast(city) do
      weather_data =
        SoggyWaffle.WeatherAPI.ResponseParser.parse_response(response)

      SoggyWaffle.Weather.imminent_rain?(weather_data, datetime)
    end
  end

end